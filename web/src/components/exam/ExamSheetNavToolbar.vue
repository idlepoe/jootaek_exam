<template>
  <q-toolbar
    class="bg-white text-grey-9 q-px-none q-py-none exam-page-sticky-toolbar exam-sheet-nav-toolbar-inner"
    :class="stickyToolbarHeightClass"
  >
    <template v-if="stickyButtonOrder === 'prev-next'">
      <q-btn
        unelevated
        no-caps
        class="col"
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
        class="col"
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
        class="col"
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
        class="col"
        :size="navBtnSize"
        color="grey-3"
        text-color="grey-9"
        label="이전"
        :disable="prevDisabled"
        @click="emit('prev')"
      />
    </template>
  </q-toolbar>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { storeToRefs } from 'pinia';
import { useExamUserOptionsStore } from 'stores/exam-user-options';

defineProps<{
  prevDisabled: boolean;
  nextDisabled: boolean;
}>();

const emit = defineEmits<{
  prev: [];
  next: [];
}>();

const examUserOpts = useExamUserOptionsStore();
const { stickyButtonHeight, stickyButtonOrder } = storeToRefs(examUserOpts);

const stickyToolbarHeightClass = computed(
  () => `exam-page-sticky-toolbar--${stickyButtonHeight.value}`,
);

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
.exam-sheet-nav-toolbar-inner {
  box-shadow: none !important;
  padding-left: 0 !important;
  padding-right: 0 !important;
  padding-bottom: env(safe-area-inset-bottom, 0px);
}
</style>
