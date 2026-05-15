import 'package:get/get.dart';

import '../../../../core/exam_log.dart';
import '../../../../core/exam_toast.dart';
import '../../../../data/repositories/exam_progress_repository.dart';
import '../../../../data/repositories/exam_remote_repository.dart';

class SessionListController extends GetxController {
  final loading = true.obs;
  final error = ''.obs;
  final sessions = <String>[].obs;
  final totalsBySession = <String, int>{}.obs;

  late final String subject;
  late final ExamRemoteRepository _remote;
  late final ExamProgressRepository _progress;

  @override
  void onInit() {
    super.onInit();
    subject = Get.parameters['subject'] ?? '';
    _remote = Get.find<ExamRemoteRepository>();
    _progress = Get.find<ExamProgressRepository>();
    _load();
  }

  Future<void> _load() async {
    loading.value = true;
    error.value = '';
    try {
      final manifest = await _remote.fetchExamSessionsManifest();
      final list = _remote.listSessionsFromManifest(manifest);
      sessions.assignAll(list);
      await _loadQuestionTotals(list);
    } catch (e, st) {
      logExamError('SessionListController._load', e, st);
      error.value = '회차 목록을 불러오지 못했습니다: $e';
      showExamErrorToast('오류', error.value);
    } finally {
      loading.value = false;
    }
  }

  Future<void> _loadQuestionTotals(List<String> sessionList) async {
    final map = <String, int>{};
    await Future.wait(
      sessionList.map((s) async {
        try {
          final all = await _remote.fetchExamJson(s);
          map[s] = all.where((q) => q.subject == subject).length;
        } catch (e, st) {
          logExamError('SessionListController._loadQuestionTotals($s)', e, st);
          map[s] = 0;
        }
      }),
    );
    totalsBySession.assignAll(map);
  }

  String progressPercentLabel(String session) {
    final total = totalsBySession[session];
    if (total == null) return '—';
    if (total <= 0) return '0%';
    final idx = _progress.readExamProgress(subject, session, total);
    final pct = ((idx / total) * 100).round().clamp(0, 100);
    return '$pct%';
  }

  String repeatCountLabel(String session) =>
      '회독 ${_progress.readRepeatCount(subject, session)}';
}
