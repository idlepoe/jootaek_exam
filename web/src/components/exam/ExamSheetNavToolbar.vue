<template>
  <component :is="wrapperTag" v-if="show" v-bind="wrapperBind">
    <q-toolbar
      class="bg-white text-grey-9 shadow-up-2 q-px-sm q-py-xs exam-page-sticky-toolbar"
      :class="stickyToolbarHeightClass"
    >
      <template v-if="stickyButtonOrder === 'prev-next'">
        <q-btn
          unelevated
          no-caps
          class="col q-mx-xs"
          :size="navBtnSize"
          color="grey-3"
          text-color="grey-9"
          label="이전"
          :disable="prevDisabled"
          @click="emit('prev')"
        />
        <q-btn
          unelevated
          no-caps
          class="col q-mx-xs"
          :size="navBtnSize"
          color="primary"
          text-color="white"
          label="다음"
          :disable="nextDisabled"
          @click="emit('next')"
        />
      </template>
      <template v-else>
        <q-btn
          unelevated
          no-caps
          class="col q-mx-xs"
          :size="navBtnSize"
          color="primary"
          text-color="white"
          label="다음"
          :disable="nextDisabled"
          @click="emit('next')"
        />
        <q-btn
          unelevated
          no-caps
          class="col q-mx-xs"
          :size="navBtnSize"
          color="grey-3"
          text-color="grey-9"
          label="이전"
          :disable="prevDisabled"
          @click="emit('prev')"
        />
      </template>
    </q-toolbar>
  </component>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { storeToRefs } from 'pinia';
import { useExamUserOptionsStore } from 'stores/exam-user-options';

const props = withDefaults(
  defineProps<{
    show: boolean;
    prevDisabled: boolean;
    nextDisabled: boolean;
    /** true면 고정 하단이 아니라 일반 블록(옵션 화면 미리보기 등) */
    embedded?: boolean;
  }>(),
  { embedded: false },
);

const emit = defineEmits<{
  prev: [];
  next: [];
}>();

const examUserOpts = useExamUserOptionsStore();
const { stickyButtonHeight, stickyButtonOrder } = storeToRefs(examUserOpts);

const stickyToolbarHeightClass = computed(
  () => `exam-page-sticky-toolbar--${stickyButtonHeight.value}`,
);

const wrapperTag = computed(() => (props.embedded ? 'div' : 'q-page-sticky'));

const wrapperBind = computed(() => {
  if (props.embedded) {
    return { class: 'exam-sheet-nav-toolbar--embedded' };
  }
  return { position: 'bottom' as const, expand: true as const };
});

/** 시험 옵션의 하단 버튼 영역 높이와 맞춤 (Quasar QBtn size) */
const navBtnSize = computed(() => {
  switch (stickyButtonHeight.value) {
    case 'large':
      return 'lg' as const;
    case 'xlarge':
      return 'xl' as const;
    default:
      return 'md' as const;
  }
});
</script>

<style scoped>
.exam-sheet-nav-toolbar--embedded {
  width: 100%;
}
</style>
