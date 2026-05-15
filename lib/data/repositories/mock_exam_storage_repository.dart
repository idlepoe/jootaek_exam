import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exam_log.dart';
import '../models/mock_exam.dart';

class MockExamStorageRepository {
  MockExamStorageRepository(this._prefs);

  static const _keyCurrent = 'jootaek_exam:current_mock_exam';
  static const _keyHistory = 'jootaek_exam:mock_exam_history';

  final SharedPreferences _prefs;

  static Future<MockExamStorageRepository> create() async {
    final prefs = await SharedPreferences.getInstance();
    return MockExamStorageRepository(prefs);
  }

  MockExamState? readCurrentMockExam() {
    try {
      final raw = _prefs.getString(_keyCurrent);
      if (raw == null) return null;
      return MockExamState.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (e, st) {
      logExamError('MockExamStorageRepository.readCurrentMockExam', e, st);
      return null;
    }
  }

  Future<void> writeCurrentMockExam(MockExamState state) async {
    await _prefs.setString(_keyCurrent, jsonEncode(state.toJson()));
  }

  Future<void> clearCurrentMockExam() async {
    await _prefs.remove(_keyCurrent);
  }

  List<MockExamHistoryEntry> readMockHistory() {
    try {
      final raw = _prefs.getString(_keyHistory);
      if (raw == null) return [];
      final parsed = jsonDecode(raw);
      if (parsed is! List) return [];
      return parsed
          .map((e) => MockExamHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      logExamError('MockExamStorageRepository.readMockHistory', e, st);
      return [];
    }
  }

  Future<void> appendMockHistory(MockExamHistoryEntry entry) async {
    final list = readMockHistory()..add(entry);
    await _prefs.setString(
      _keyHistory,
      jsonEncode(list.map((e) => e.toJson()).toList()),
    );
  }

  Future<void> clearMockHistory() async {
    await _prefs.remove(_keyHistory);
  }
}
