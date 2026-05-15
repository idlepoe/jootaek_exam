// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_user_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamUserOptions _$ExamUserOptionsFromJson(Map<String, dynamic> json) =>
    _ExamUserOptions(
      themeMode:
          $enumDecodeNullable(_$ExamThemeModeEnumMap, json['themeMode']) ??
          ExamThemeMode.system,
      correctHighlightHex: json['correctHighlightHex'] as String? ?? '#ffcccc',
      correctHighlightTextHex:
          json['correctHighlightTextHex'] as String? ?? '#ffffff',
      pickChoiceHighlightHex:
          json['pickChoiceHighlightHex'] as String? ?? '#1565c0',
      pickChoiceHighlightTextHex:
          json['pickChoiceHighlightTextHex'] as String? ?? '#ffffff',
      stickyButtonHeight:
          $enumDecodeNullable(
            _$StickyButtonHeightEnumMap,
            json['stickyButtonHeight'],
          ) ??
          StickyButtonHeight.normal,
      questionTextSize:
          $enumDecodeNullable(
            _$QuestionTextSizeEnumMap,
            json['questionTextSize'],
          ) ??
          QuestionTextSize.md,
      stickyButtonOrder:
          $enumDecodeNullable(
            _$StickyButtonOrderEnumMap,
            json['stickyButtonOrder'],
          ) ??
          StickyButtonOrder.prevNext,
    );

Map<String, dynamic> _$ExamUserOptionsToJson(
  _ExamUserOptions instance,
) => <String, dynamic>{
  'themeMode': _$ExamThemeModeEnumMap[instance.themeMode]!,
  'correctHighlightHex': instance.correctHighlightHex,
  'correctHighlightTextHex': instance.correctHighlightTextHex,
  'pickChoiceHighlightHex': instance.pickChoiceHighlightHex,
  'pickChoiceHighlightTextHex': instance.pickChoiceHighlightTextHex,
  'stickyButtonHeight':
      _$StickyButtonHeightEnumMap[instance.stickyButtonHeight]!,
  'questionTextSize': _$QuestionTextSizeEnumMap[instance.questionTextSize]!,
  'stickyButtonOrder': _$StickyButtonOrderEnumMap[instance.stickyButtonOrder]!,
};

const _$ExamThemeModeEnumMap = {
  ExamThemeMode.system: 'system',
  ExamThemeMode.light: 'light',
  ExamThemeMode.dark: 'dark',
};

const _$StickyButtonHeightEnumMap = {
  StickyButtonHeight.normal: 'normal',
  StickyButtonHeight.large: 'large',
  StickyButtonHeight.xlarge: 'xlarge',
};

const _$QuestionTextSizeEnumMap = {
  QuestionTextSize.sm: 'sm',
  QuestionTextSize.md: 'md',
  QuestionTextSize.lg: 'lg',
  QuestionTextSize.xl: 'xl',
  QuestionTextSize.max: 'max',
};

const _$StickyButtonOrderEnumMap = {
  StickyButtonOrder.prevNext: 'prev-next',
  StickyButtonOrder.nextPrev: 'next-prev',
};
