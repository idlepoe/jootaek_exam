<template>
  <q-page padding class="q-pb-xl">
    <q-inner-loading :showing="loading" color="primary" />

    <template v-if="!loading && current">
      <div class="q-mb-md" :class="questionTextClass" style="white-space: pre-wrap">
        {{ displayIndex }}. {{ current.question_text }}
      </div>
      <ExamOptionalRemoteImage :src="examQuestionImageUrl(current.id)" />
      <div class="column q-gutter-sm q-mb-lg">
        <q-card
          v-for="c in current.choices"
          :key="c.no"
          flat
          bordered
          class="q-pa-md"
          :class="choiceCardClass(c.no)"
        >
          <div class="text-body2">
            <span class="text-weight-bold">{{ c.no }}.</span>
            {{ c.text }}
          </div>
          <ExamOptionalRemoteImage :src="examChoiceImageUrl(current.id, c.no)" />
        </q-card>
      </div>
    </template>

    <div v-else-if="!loading && !loadError && questions.length === 0" class="text-grey">
      해당 모의고사 이력을 찾을 수 없습니다.
    </div>
    <div v-if="loadError" class="text-negative">{{ loadError }}</div>

    <q-page-sticky v-if="!loading && questions.length > 0" position="bottom" expand>
      <q-toolbar
        class="bg-white text-grey-9 shadow-up-2 q-px-sm q-py-xs exam-page-sticky-toolbar"
        :class="stickyToolbarHeightClass"
      >
        <template v-if="stickyButtonOrder === 'prev-next'">
          <q-btn
            unelevated
            no-caps
            class="col q-mx-xs"
            color="grey-3"
            text-color="grey-9"
            label="이전"
            :disable="index <= 0"
            @click="prev"
          />
          <q-btn
            unelevated
            no-caps
            class="col q-mx-xs"
            color="primary"
            text-color="white"
            label="다음"
            :disable="index >= questions.length - 1"
            @click="next"
          />
        </template>
        <template v-else>
          <q-btn
            unelevated
            no-caps
            class="col q-mx-xs"
            color="primary"
            text-color="white"
            label="다음"
            :disable="index >= questions.length - 1"
            @click="next"
          />
          <q-btn
            unelevated
            no-caps
            class="col q-mx-xs"
            color="grey-3"
            text-color="grey-9"
            label="이전"
            :disable="index <= 0"
            @click="prev"
          />
        </template>
      </q-toolbar>
    </q-page-sticky>
  </q-page>
</template>

<script setup lang="ts">
import { computed, onMounted, onUnmounted, ref, watch } from 'vue';
import { storeToRefs } from 'pinia';
import { useRouter } from 'vue-router';
import { useQuasar } from 'quasar';
import type { ExamQuestion } from 'src/types/exam';
import { readMockHistory } from 'src/exam/mockExamStorage';
import { useExamSheetToolbarStore } from 'stores/exam-sheet-toolbar';
import { useExamUserOptionsStore } from 'stores/exam-user-options';
import ExamOptionalRemoteImage from 'src/components/exam/ExamOptionalRemoteImage.vue';
import { examChoiceImageUrl, examQuestionImageUrl } from 'src/exam/constants';

const props = defineProps<{
  subject: string;
  endedAt: string;
}>();

const router = useRouter();
const $q = useQuasar();
const toolbarStore = useExamSheetToolbarStore();
const examUserOpts = useExamUserOptionsStore();
const { questionTextSize, stickyButtonHeight, stickyButtonOrder } = storeToRefs(examUserOpts);

const questionTextClass = computed(
  () => `text-body1 exam-question-text--${questionTextSize.value}`,
);
const stickyToolbarHeightClass = computed(
  () => `exam-page-sticky-toolbar--${stickyButtonHeight.value}`,
);

const loading = ref(true);
const loadError = ref('');
const questions = ref<ExamQuestion[]>([]);
const answers = ref<(number | null)[]>([]);
const index = ref(0);

const current = computed(() => questions.value[index.value] ?? null);
const total = computed(() => questions.value.length);
const displayIndex = computed(() => (total.value ? index.value + 1 : 0));

const userAnswer = computed(() => {
  const q = current.value;
  if (!q) return null;
  return answers.value[index.value] ?? null;
});

function choiceCardClass(no: number): string | Record<string, boolean> {
  const q = current.value;
  if (!q) return '';
  const ua = userAnswer.value;
  if (no === q.correct_answer) return 'exam-correct-highlight';
  if (ua != null && no === ua && ua !== q.correct_answer) return 'bg-blue-2';
  return '';
}

const toolbarStatusLines = computed(() => {
  if (loading.value) return { line1: '', line2: '' };
  const c = current.value;
  if (!c || total.value === 0) return { line1: '', line2: '' };
  return {
    line1: `${c.exam_type} ${c.subject}`,
    line2: `${displayIndex.value}(현재문항)/${total.value}(총문항)`,
  };
});

watch(
  toolbarStatusLines,
  ({ line1, line2 }) => {
    toolbarStore.setSheetToolbarLines(line1, line2);
  },
  { immediate: true },
);

onUnmounted(() => {
  toolbarStore.clearSheetToolbar();
});

function prev() {
  if (index.value > 0) index.value--;
}

function next() {
  if (index.value < questions.value.length - 1) index.value++;
}

onMounted(() => {
  loading.value = true;
  loadError.value = '';
  const ended = Number(props.endedAt);
  if (!Number.isFinite(ended)) {
    loadError.value = '잘못된 이력 링크입니다.';
    $q.notify({ type: 'negative', message: loadError.value });
    void router.replace({ name: 'exam-main' });
    loading.value = false;
    return;
  }
  const entry = readMockHistory().find((e) => e.subject === props.subject && e.endedAt === ended);
  if (!entry?.questions?.length) {
    loadError.value = '모의고사 이력을 찾을 수 없습니다.';
    $q.notify({ type: 'warning', message: loadError.value });
    void router.replace({ name: 'exam-main' });
    loading.value = false;
    return;
  }
  questions.value = entry.questions;
  const n = entry.questions.length;
  const raw = entry.answers ?? [];
  answers.value =
    raw.length === n
      ? [...raw]
      : entry.questions.map((_, i) => (i < raw.length ? (raw[i] ?? null) : null));
  index.value = 0;
  loading.value = false;
});
</script>
