import 'dart:async';

import 'package:get/get.dart';

import '../../../../core/exam_constants.dart';
import '../../../../core/exam_toast.dart';
import '../../../../data/models/mock_exam.dart';
import '../../../../data/repositories/exam_progress_repository.dart';
import '../../../../data/repositories/mock_exam_storage_repository.dart';

class MainSubjectController extends GetxController {
  final mockSession = Rxn<MockExamState>();
  final mockHistory = <MockExamHistoryEntry>[].obs;
  final now = DateTime.now().obs;

  Timer? _tickTimer;
  late final MockExamStorageRepository _mockStorage;
  late final ExamProgressRepository _progress;

  @override
  void onInit() {
    super.onInit();
    _mockStorage = Get.find<MockExamStorageRepository>();
    _progress = Get.find<ExamProgressRepository>();
    refreshAll();
  }

  @override
  void onClose() {
    _tickTimer?.cancel();
    super.onClose();
  }

  void refreshAll() {
    refreshMockBanner();
    refreshMockHistory();
    _syncTickTimer();
  }

  void refreshMockBanner() {
    final raw = _mockStorage.readCurrentMockExam();
    if (raw != null &&
        raw.questions.isNotEmpty &&
        examSubjects.contains(raw.subject)) {
      mockSession.value = raw;
    } else {
      mockSession.value = null;
    }
    now.value = DateTime.now();
  }

  void refreshMockHistory() {
    mockHistory.assignAll(
      _mockStorage.readMockHistory()
        ..sort((a, b) => b.endedAt.compareTo(a.endedAt)),
    );
  }

  bool mockBannerFor(String subject) {
    final s = mockSession.value;
    return s != null && s.subject == subject && s.questions.isNotEmpty;
  }

  int get displayCurrentIndex {
    final s = mockSession.value;
    if (s == null || s.questions.isEmpty) return 0;
    return (s.currentIndex + 1).clamp(1, s.questions.length);
  }

  int get answeredCount {
    final s = mockSession.value;
    if (s == null) return 0;
    return s.answers.where((a) => a != null).length;
  }

  String get elapsedLabel {
    final s = mockSession.value;
    if (s == null) return '—';
    final ms = DateTime.now().millisecondsSinceEpoch - s.startedAt;
    final m = ms ~/ 60000;
    final sec = (ms % 60000) ~/ 1000;
    return '$m:${sec.toString().padLeft(2, '0')}';
  }

  Future<void> clearReadingProgress() async {
    await _progress.clearAllExamProgressAndRepeat();
    showExamInfoToast('안내', '회독 진행 및 회독 횟수를 초기화했습니다.');
  }

  Future<void> clearMockHistory() async {
    await _mockStorage.clearMockHistory();
    refreshMockHistory();
    showExamInfoToast('안내', '모의고사 이력을 삭제했습니다.');
  }

  Future<void> endMockExam() async {
    await _mockStorage.clearCurrentMockExam();
    refreshMockBanner();
    showExamInfoToast('안내', '모의고사를 종료했습니다.');
  }

  void _syncTickTimer() {
    _tickTimer?.cancel();
    if (mockSession.value != null && mockSession.value!.questions.isNotEmpty) {
      _tickTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        now.value = DateTime.now();
      });
    }
  }

  static int historyScorePercent(MockExamHistoryEntry entry) {
    final n = entry.questions.length;
    if (n <= 0) return 0;
    return ((entry.correctCount / n) * 100).round();
  }

  static String formatHistoryStart(MockExamHistoryEntry entry) {
    final ts = DateTime.fromMillisecondsSinceEpoch(
      entry.startedAt ?? entry.endedAt,
    );
    return '${ts.year}.${ts.month.toString().padLeft(2, '0')}.${ts.day.toString().padLeft(2, '0')} '
        '${ts.hour > 12 ? '오후' : '오전'} ${ts.hour % 12 == 0 ? 12 : ts.hour % 12}:${ts.minute.toString().padLeft(2, '0')}';
  }

  static String formatHistoryElapsed(MockExamHistoryEntry entry) {
    final start = entry.startedAt ?? entry.endedAt;
    final ms = entry.endedAt - start;
    final m = ms ~/ 60000;
    final s = (ms % 60000) ~/ 1000;
    return '$m분 $s초';
  }
}
