import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exam_log.dart';
import '../models/exam_user_options.dart';

class ExamUserOptionsRepository {
  ExamUserOptionsRepository(this._prefs);

  static const _lsKey = 'jootaek_exam:user_options';

  final SharedPreferences _prefs;

  static Future<ExamUserOptionsRepository> create() async {
    final prefs = await SharedPreferences.getInstance();
    return ExamUserOptionsRepository(prefs);
  }

  ExamUserOptions read() {
    try {
      final raw = _prefs.getString(_lsKey);
      if (raw == null || raw.isEmpty) {
        return defaultExamUserOptions;
      }
      final parsed = jsonDecode(raw);
      if (parsed is! Map<String, dynamic>) {
        return defaultExamUserOptions;
      }
      return normalizeExamUserOptions(ExamUserOptions.fromJson(parsed));
    } catch (e, st) {
      logExamError('ExamUserOptionsRepository.read', e, st);
      return defaultExamUserOptions;
    }
  }

  Future<void> write(ExamUserOptions opts) async {
    final normalized = normalizeExamUserOptions(opts);
    await _prefs.setString(_lsKey, jsonEncode(normalized.toJson()));
  }
}
