// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MockExamState _$MockExamStateFromJson(Map<String, dynamic> json) =>
    _MockExamState(
      subject: json['subject'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => ExamQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => (e as num?)?.toInt())
          .toList(),
      startedAt: (json['startedAt'] as num).toInt(),
      currentIndex: (json['currentIndex'] as num).toInt(),
    );

Map<String, dynamic> _$MockExamStateToJson(_MockExamState instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'questions': instance.questions,
      'answers': instance.answers,
      'startedAt': instance.startedAt,
      'currentIndex': instance.currentIndex,
    };

_MockExamHistoryEntry _$MockExamHistoryEntryFromJson(
  Map<String, dynamic> json,
) => _MockExamHistoryEntry(
  subject: json['subject'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => ExamQuestion.fromJson(e as Map<String, dynamic>))
      .toList(),
  answers: (json['answers'] as List<dynamic>)
      .map((e) => (e as num?)?.toInt())
      .toList(),
  startedAt: (json['startedAt'] as num?)?.toInt(),
  endedAt: (json['endedAt'] as num).toInt(),
  correctCount: (json['correctCount'] as num).toInt(),
  isPassed: json['isPassed'] as bool,
);

Map<String, dynamic> _$MockExamHistoryEntryToJson(
  _MockExamHistoryEntry instance,
) => <String, dynamic>{
  'subject': instance.subject,
  'questions': instance.questions,
  'answers': instance.answers,
  'startedAt': instance.startedAt,
  'endedAt': instance.endedAt,
  'correctCount': instance.correctCount,
  'isPassed': instance.isPassed,
};
