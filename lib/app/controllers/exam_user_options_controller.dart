import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/exam_user_options.dart';
import '../../data/repositories/exam_user_options_repository.dart';

class ExamUserOptionsController extends GetxController {
  late final ExamUserOptionsRepository _repo;

  final options = defaultExamUserOptions.obs;

  @override
  void onInit() {
    super.onInit();
    _repo = Get.find<ExamUserOptionsRepository>();
    options.value = _repo.read();
    _applyTheme();
  }

  ThemeMode get themeMode => themeModeFromExam(options.value.themeMode);

  Color get correctBg => colorFromHex(options.value.correctHighlightHex);
  Color get correctText => colorFromHex(options.value.correctHighlightTextHex);
  Color get pickBg => colorFromHex(options.value.pickChoiceHighlightHex);
  Color get pickText => colorFromHex(options.value.pickChoiceHighlightTextHex);

  Future<void> updateOptions(ExamUserOptions patch) async {
    final merged = normalizeExamUserOptions(
      options.value.copyWith(
        themeMode: patch.themeMode,
        correctHighlightHex: patch.correctHighlightHex,
        correctHighlightTextHex: patch.correctHighlightTextHex,
        pickChoiceHighlightHex: patch.pickChoiceHighlightHex,
        pickChoiceHighlightTextHex: patch.pickChoiceHighlightTextHex,
        stickyButtonHeight: patch.stickyButtonHeight,
        questionTextSize: patch.questionTextSize,
        stickyButtonOrder: patch.stickyButtonOrder,
      ),
    );
    options.value = merged;
    await _repo.write(merged);
    _applyTheme();
    update();
  }

  Future<void> setThemeMode(ExamThemeMode mode) =>
      updateOptions(options.value.copyWith(themeMode: mode));

  Future<void> setCorrectHighlightHex(String hex) =>
      updateOptions(options.value.copyWith(correctHighlightHex: hex));

  Future<void> setCorrectHighlightTextHex(String hex) =>
      updateOptions(options.value.copyWith(correctHighlightTextHex: hex));

  Future<void> setPickChoiceHighlightHex(String hex) =>
      updateOptions(options.value.copyWith(pickChoiceHighlightHex: hex));

  Future<void> setPickChoiceHighlightTextHex(String hex) =>
      updateOptions(options.value.copyWith(pickChoiceHighlightTextHex: hex));

  Future<void> setStickyButtonHeight(StickyButtonHeight h) =>
      updateOptions(options.value.copyWith(stickyButtonHeight: h));

  Future<void> setQuestionTextSize(QuestionTextSize s) =>
      updateOptions(options.value.copyWith(questionTextSize: s));

  Future<void> setStickyButtonOrder(StickyButtonOrder o) =>
      updateOptions(options.value.copyWith(stickyButtonOrder: o));

  void _applyTheme() {
    Get.changeThemeMode(themeMode);
  }
}
