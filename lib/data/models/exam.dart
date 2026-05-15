import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
abstract class ExamChoice with _$ExamChoice {
  const factory ExamChoice({
    required int no,
    required String text,
  }) = _ExamChoice;

  factory ExamChoice.fromJson(Map<String, dynamic> json) =>
      _$ExamChoiceFromJson(json);
}

@freezed
abstract class ExamQuestion with _$ExamQuestion {
  const factory ExamQuestion({
    required String id,
    @JsonKey(name: 'exam_type') required String examType,
    @JsonKey(name: 'exam_session') required String examSession,
    required String subject,
    @JsonKey(name: 'question_number') required int questionNumber,
    @JsonKey(name: 'question_text') required String questionText,
    required List<ExamChoice> choices,
    @JsonKey(name: 'correct_answer') required int correctAnswer,
  }) = _ExamQuestion;

  factory ExamQuestion.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionFromJson(json);
}

@freezed
abstract class ExamSessionsManifest with _$ExamSessionsManifest {
  const factory ExamSessionsManifest({
    required List<String> sessions,
  }) = _ExamSessionsManifest;

  factory ExamSessionsManifest.fromJson(Map<String, dynamic> json) =>
      _$ExamSessionsManifestFromJson(json);
}
