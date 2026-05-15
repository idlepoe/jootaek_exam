import 'package:shared_preferences/shared_preferences.dart';

class ExamProgressRepository {
  ExamProgressRepository(this._prefs);

  static const _lsPrefix = 'jootaek_exam:qidx:';
  static const _lsRepeatPrefix = 'jootaek_exam:repeat:';

  final SharedPreferences _prefs;

  static Future<ExamProgressRepository> create() async {
    final prefs = await SharedPreferences.getInstance();
    return ExamProgressRepository(prefs);
  }

  String _progressKey(String subject, String examSession) =>
      '$_lsPrefix$subject:$examSession';

  String _repeatKey(String subject, String examSession) =>
      '$_lsRepeatPrefix$subject:$examSession';

  int readRepeatCount(String subject, String examSession) {
    final raw = _prefs.getString(_repeatKey(subject, examSession));
    if (raw == null) return 0;
    final n = int.tryParse(raw);
    if (n == null || n < 0) return 0;
    return n;
  }

  int incrementRepeatCount(String subject, String examSession) {
    final next = readRepeatCount(subject, examSession) + 1;
    _prefs.setString(_repeatKey(subject, examSession), next.toString());
    return next;
  }

  void resetExamProgress(String subject, String examSession) {
    _prefs.remove(_progressKey(subject, examSession));
  }

  int readExamProgress(String subject, String examSession, int length) {
    if (length <= 0) return 0;
    final raw = _prefs.getString(_progressKey(subject, examSession));
    if (raw == null) return 0;
    final n = int.tryParse(raw);
    if (n == null || n < 0) return 0;
    return n < length ? n : length - 1;
  }

  void writeExamProgress(String subject, String examSession, int index) {
    _prefs.setString(_progressKey(subject, examSession), index.toString());
  }

  Future<void> clearAllExamProgressAndRepeat() async {
    final keys = _prefs.getKeys().where(
      (k) => k.startsWith(_lsPrefix) || k.startsWith(_lsRepeatPrefix),
    );
    for (final k in keys) {
      await _prefs.remove(k);
    }
  }
}
