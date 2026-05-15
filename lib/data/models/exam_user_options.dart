import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_user_options.freezed.dart';
part 'exam_user_options.g.dart';

enum ExamThemeMode {
  @JsonValue('system')
  system,
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
}

enum StickyButtonHeight {
  @JsonValue('normal')
  normal,
  @JsonValue('large')
  large,
  @JsonValue('xlarge')
  xlarge,
}

enum QuestionTextSize {
  @JsonValue('sm')
  sm,
  @JsonValue('md')
  md,
  @JsonValue('lg')
  lg,
  @JsonValue('xl')
  xl,
  @JsonValue('max')
  max,
}

enum StickyButtonOrder {
  @JsonValue('prev-next')
  prevNext,
  @JsonValue('next-prev')
  nextPrev,
}

@freezed
abstract class ExamUserOptions with _$ExamUserOptions {
  const factory ExamUserOptions({
    @Default(ExamThemeMode.system) ExamThemeMode themeMode,
    @Default('#ffcccc') String correctHighlightHex,
    @Default('#ffffff') String correctHighlightTextHex,
    @Default('#1565c0') String pickChoiceHighlightHex,
    @Default('#ffffff') String pickChoiceHighlightTextHex,
    @Default(StickyButtonHeight.normal) StickyButtonHeight stickyButtonHeight,
    @Default(QuestionTextSize.md) QuestionTextSize questionTextSize,
    @Default(StickyButtonOrder.prevNext) StickyButtonOrder stickyButtonOrder,
  }) = _ExamUserOptions;

  factory ExamUserOptions.fromJson(Map<String, dynamic> json) =>
      _$ExamUserOptionsFromJson(json);
}

const defaultExamUserOptions = ExamUserOptions();

ExamUserOptions normalizeExamUserOptions(ExamUserOptions? partial) {
  final p = partial ?? const ExamUserOptions();
  return ExamUserOptions(
    themeMode: _coerceThemeMode(p.themeMode),
    correctHighlightHex: _coerceHex(
      p.correctHighlightHex,
      defaultExamUserOptions.correctHighlightHex,
    ),
    correctHighlightTextHex: _coerceHex(
      p.correctHighlightTextHex,
      defaultExamUserOptions.correctHighlightTextHex,
    ),
    pickChoiceHighlightHex: _coerceHex(
      p.pickChoiceHighlightHex,
      defaultExamUserOptions.pickChoiceHighlightHex,
    ),
    pickChoiceHighlightTextHex: _coerceHex(
      p.pickChoiceHighlightTextHex,
      defaultExamUserOptions.pickChoiceHighlightTextHex,
    ),
    stickyButtonHeight: p.stickyButtonHeight,
    questionTextSize: p.questionTextSize,
    stickyButtonOrder: p.stickyButtonOrder,
  );
}

ExamThemeMode _coerceThemeMode(ExamThemeMode v) => v;

bool _isValidHex(String s) => RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(s);

String _coerceHex(String v, String fallback) =>
    _isValidHex(v) ? v : fallback;

Color colorFromHex(String hex) {
  final h = hex.replaceFirst('#', '');
  return Color(int.parse('FF$h', radix: 16));
}

ThemeMode themeModeFromExam(ExamThemeMode mode) {
  switch (mode) {
    case ExamThemeMode.light:
      return ThemeMode.light;
    case ExamThemeMode.dark:
      return ThemeMode.dark;
    case ExamThemeMode.system:
      return ThemeMode.system;
  }
}

double questionTextFontSize(QuestionTextSize size) {
  switch (size) {
    case QuestionTextSize.sm:
      return 14;
    case QuestionTextSize.md:
      return 16;
    case QuestionTextSize.lg:
      return 18;
    case QuestionTextSize.xl:
      return 20;
    case QuestionTextSize.max:
      return 22;
  }
}

double choiceTextFontSize(QuestionTextSize size) =>
    questionTextFontSize(size) - 2;

double navToolbarHeight(StickyButtonHeight h) {
  switch (h) {
    case StickyButtonHeight.normal:
      return 48;
    case StickyButtonHeight.large:
      return 56;
    case StickyButtonHeight.xlarge:
      return 64;
  }
}
