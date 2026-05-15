// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamChoice _$ExamChoiceFromJson(Map<String, dynamic> json) =>
    _ExamChoice(no: (json['no'] as num).toInt(), text: json['text'] as String);

Map<String, dynamic> _$ExamChoiceToJson(_ExamChoice instance) =>
    <String, dynamic>{'no': instance.no, 'text': instance.text};

_ExamQuestion _$ExamQuestionFromJson(Map<String, dynamic> json) =>
    _ExamQuestion(
      id: json['id'] as String,
      examType: json['exam_type'] as String,
      examSession: json['exam_session'] as String,
      subject: json['subject'] as String,
      questionNumber: (json['question_number'] as num).toInt(),
      questionText: json['question_text'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ExamChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswer: (json['correct_answer'] as num).toInt(),
    );

Map<String, dynamic> _$ExamQuestionToJson(_ExamQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_type': instance.examType,
      'exam_session': instance.examSession,
      'subject': instance.subject,
      'question_number': instance.questionNumber,
      'question_text': instance.questionText,
      'choices': instance.choices,
      'correct_answer': instance.correctAnswer,
    };

_ExamSessionsManifest _$ExamSessionsManifestFromJson(
  Map<String, dynamic> json,
) => _ExamSessionsManifest(
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ExamSessionsManifestToJson(
  _ExamSessionsManifest instance,
) => <String, dynamic>{'sessions': instance.sessions};
