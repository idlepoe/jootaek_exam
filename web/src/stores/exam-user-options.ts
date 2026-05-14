import { defineStore, acceptHMRUpdate } from 'pinia';
import { ref } from 'vue';
import type { ExamUserOptions } from 'src/exam/examUserOptions';
import {
  mergeExamUserOptionsPatch,
  readExamUserOptions,
  writeExamUserOptions,
  syncExamUserOptionsToDom,
} from 'src/exam/examUserOptions';

function assignFromOptions(
  target: {
    themeMode: ReturnType<typeof ref<ExamUserOptions['themeMode']>>;
    correctHighlightHex: ReturnType<typeof ref<string>>;
    stickyButtonHeight: ReturnType<typeof ref<ExamUserOptions['stickyButtonHeight']>>;
    questionTextSize: ReturnType<typeof ref<ExamUserOptions['questionTextSize']>>;
    stickyButtonOrder: ReturnType<typeof ref<ExamUserOptions['stickyButtonOrder']>>;
  },
  o: ExamUserOptions,
) {
  target.themeMode.value = o.themeMode;
  target.correctHighlightHex.value = o.correctHighlightHex;
  target.stickyButtonHeight.value = o.stickyButtonHeight;
  target.questionTextSize.value = o.questionTextSize;
  target.stickyButtonOrder.value = o.stickyButtonOrder;
}

export const useExamUserOptionsStore = defineStore('examUserOptions', () => {
  const initial = readExamUserOptions();

  const themeMode = ref(initial.themeMode);
  const correctHighlightHex = ref(initial.correctHighlightHex);
  const stickyButtonHeight = ref(initial.stickyButtonHeight);
  const questionTextSize = ref(initial.questionTextSize);
  const stickyButtonOrder = ref(initial.stickyButtonOrder);

  const refs = {
    themeMode,
    correctHighlightHex,
    stickyButtonHeight,
    questionTextSize,
    stickyButtonOrder,
  };

  function snapshot(): ExamUserOptions {
    return {
      themeMode: themeMode.value,
      correctHighlightHex: correctHighlightHex.value,
      stickyButtonHeight: stickyButtonHeight.value,
      questionTextSize: questionTextSize.value,
      stickyButtonOrder: stickyButtonOrder.value,
    };
  }

  function hydrateFromStorage() {
    const next = readExamUserOptions();
    assignFromOptions(refs, next);
    syncExamUserOptionsToDom(next);
  }

  function patchAndPersist(patch: Partial<ExamUserOptions>) {
    const next = mergeExamUserOptionsPatch(snapshot(), patch);
    assignFromOptions(refs, next);
    writeExamUserOptions(next);
    syncExamUserOptionsToDom(next);
  }

  return {
    themeMode,
    correctHighlightHex,
    stickyButtonHeight,
    questionTextSize,
    stickyButtonOrder,
    hydrateFromStorage,
    patchAndPersist,
  };
});

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useExamUserOptionsStore, import.meta.hot));
}
