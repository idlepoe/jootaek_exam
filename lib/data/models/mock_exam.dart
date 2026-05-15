import 'package:freezed_annotation/freezed_annotation.dart';

import 'exam.dart';

part 'mock_exam.freezed.dart';
part 'mock_exam.g.dart';

@freezed
abstract class MockExamState with _$MockExamState {
  const factory MockExamState({
    required String subject,
    required List<ExamQuestion> questions,
    required List<int?> answers,
    required int startedAt,
    required int currentIndex,
  }) = _MockExamState;

  factory MockExamState.fromJson(Map<String, dynamic> json) =>
      _$MockExamStateFromJson(json);
}

@freezed
abstract class MockExamHistoryEntry with _$MockExamHistoryEntry {
  const factory MockExamHistoryEntry({
    required String subject,
    required List<ExamQuestion> questions,
    required List<int?> answers,
    int? startedAt,
    required int endedAt,
    required int correctCount,
    required bool isPassed,
  }) = _MockExamHistoryEntry;

  factory MockExamHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$MockExamHistoryEntryFromJson(json);
}
