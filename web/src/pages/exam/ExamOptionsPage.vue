<template>
  <q-page padding class="q-pb-xl">
    <q-list bordered separator class="rounded-borders">
      <q-item>
        <q-item-section>
          <q-item-label>테마</q-item-label>
          <q-item-label caption>시스템 설정을 따르거나 라이트/다크로 고정합니다.</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-btn-toggle
            :model-value="themeMode"
            spread
            no-caps
            unelevated
            toggle-color="primary"
            color="grey-3"
            text-color="grey-8"
            :options="themeOptions"
            @update:model-value="onThemeChange"
          />
        </q-item-section>
      </q-item>

      <q-item clickable @click="openColorDialog">
        <q-item-section>
          <q-item-label>정답 하이라이트 색</q-item-label>
          <q-item-label caption>답안지·모의복습에서 정답 배경에 사용합니다.</q-item-label>
        </q-item-section>
        <q-item-section side>
          <div class="row items-center q-gutter-sm no-wrap">
            <div
              class="exam-options-swatch rounded-borders"
              :style="{ backgroundColor: correctHighlightHex }"
            />
            <q-icon name="chevron_right" color="grey-6" />
          </div>
        </q-item-section>
      </q-item>

      <q-item>
        <q-item-section>
          <q-item-label>하단 버튼 영역 높이</q-item-label>
          <q-item-label caption>이전·다음 툴바의 최소 높이입니다.</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-btn-toggle
            :model-value="stickyButtonHeight"
            spread
            no-caps
            unelevated
            toggle-color="primary"
            color="grey-3"
            text-color="grey-8"
            :options="heightOptions"
            @update:model-value="onHeightChange"
          />
        </q-item-section>
      </q-item>

      <q-item>
        <q-item-section>
          <q-item-label>문제 글자 크기</q-item-label>
          <q-item-label caption>문제 본문(번호·지문)에 적용됩니다.</q-item-label>
        </q-item-section>
        <q-item-section side style="min-width: 0">
          <q-btn-toggle
            :model-value="questionTextSize"
            spread
            no-caps
            dense
            unelevated
            toggle-color="primary"
            color="grey-3"
            text-color="grey-8"
            :options="textSizeOptions"
            @update:model-value="onTextSizeChange"
          />
        </q-item-section>
      </q-item>

      <q-item>
        <q-item-section>
          <q-item-label>하단 버튼 순서</q-item-label>
          <q-item-label caption>이전/다음 버튼의 좌우 배치입니다.</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-option-group
            :model-value="stickyButtonOrder"
            type="radio"
            :options="orderOptions"
            color="primary"
            @update:model-value="onOrderChange"
          />
        </q-item-section>
      </q-item>
    </q-list>

    <q-dialog v-model="colorDialogOpen">
      <q-card style="min-width: 280px">
        <q-card-section class="text-h6">정답 색 선택</q-card-section>
        <q-card-section class="q-pt-none">
          <q-color v-model="colorDraft" default-view="palette" format-model="hex" />
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="취소" color="grey-8" no-caps @click="colorDialogOpen = false" />
          <q-btn unelevated label="확인" color="primary" no-caps @click="confirmColor" />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </q-page>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue';
import { storeToRefs } from 'pinia';
import type {
  ExamThemeMode,
  QuestionTextSize,
  StickyButtonHeight,
  StickyButtonOrder,
} from 'src/exam/examUserOptions';
import { useExamUserOptionsStore } from 'stores/exam-user-options';

const store = useExamUserOptionsStore();
const { themeMode, correctHighlightHex, stickyButtonHeight, questionTextSize, stickyButtonOrder } =
  storeToRefs(store);

const themeOptions = [
  { label: '시스템', value: 'system' as ExamThemeMode },
  { label: '라이트', value: 'light' as ExamThemeMode },
  { label: '다크', value: 'dark' as ExamThemeMode },
];

const heightOptions = [
  { label: '보통', value: 'normal' as StickyButtonHeight },
  { label: '크게', value: 'large' as StickyButtonHeight },
  { label: '더 크게', value: 'xlarge' as StickyButtonHeight },
];

const textSizeOptions = [
  { label: '아주 작게', value: 'sm' as QuestionTextSize },
  { label: '작게', value: 'md' as QuestionTextSize },
  { label: '보통', value: 'lg' as QuestionTextSize },
  { label: '크게', value: 'xl' as QuestionTextSize },
  { label: '최대', value: 'max' as QuestionTextSize },
];

const orderOptions = [
  { label: '이전 | 다음', value: 'prev-next' as StickyButtonOrder },
  { label: '다음 | 이전', value: 'next-prev' as StickyButtonOrder },
];

const colorDialogOpen = ref(false);
const colorDraft = ref(correctHighlightHex.value);

watch(correctHighlightHex, (v) => {
  colorDraft.value = v;
});

function onThemeChange(v: ExamThemeMode) {
  store.patchAndPersist({ themeMode: v });
}

function onHeightChange(v: StickyButtonHeight) {
  store.patchAndPersist({ stickyButtonHeight: v });
}

function onTextSizeChange(v: QuestionTextSize) {
  store.patchAndPersist({ questionTextSize: v });
}

function onOrderChange(v: StickyButtonOrder) {
  store.patchAndPersist({ stickyButtonOrder: v });
}

function openColorDialog() {
  colorDraft.value = correctHighlightHex.value;
  colorDialogOpen.value = true;
}

function normalizeHexFromColor(v: string | Record<string, unknown>): string {
  if (typeof v === 'string') return v;
  if (v && typeof v === 'object' && 'r' in v && 'g' in v && 'b' in v) {
    const r = Number((v as { r: number }).r);
    const g = Number((v as { g: number }).g);
    const b = Number((v as { b: number }).b);
    const toHex = (n: number) =>
      Math.min(255, Math.max(0, Math.round(n)))
        .toString(16)
        .padStart(2, '0');
    return `#${toHex(r)}${toHex(g)}${toHex(b)}`;
  }
  return correctHighlightHex.value;
}

function confirmColor() {
  const hex = normalizeHexFromColor(colorDraft.value as string | Record<string, unknown>);
  store.patchAndPersist({ correctHighlightHex: hex });
  colorDialogOpen.value = false;
}
</script>

<style scoped>
.exam-options-swatch {
  width: 28px;
  height: 28px;
  border: 1px solid rgba(0, 0, 0, 0.12);
}
.body--dark .exam-options-swatch {
  border-color: rgba(255, 255, 255, 0.2);
}
</style>
