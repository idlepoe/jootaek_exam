import 'package:get/get.dart';

import '../../../../core/exam_log.dart';
import '../../../../core/exam_toast.dart';
import '../../../../data/models/exam.dart';
import '../../../../data/repositories/exam_progress_repository.dart';
import '../../../../data/repositories/exam_remote_repository.dart';
import '../../../controllers/exam_sheet_toolbar_controller.dart';
import '../../../routes/app_routes.dart';

class AnswerSheetController extends GetxController {
  final loading = true.obs;
  final loadError = ''.obs;
  final questions = <ExamQuestion>[].obs;
  final index = 0.obs;

  late final String subject;
  late final String session;
  late final ExamRemoteRepository _remote;
  late final ExamProgressRepository _progress;
  late final ExamSheetToolbarController _toolbar;

  ExamQuestion? get current =>
      questions.isEmpty ? null : questions[index.value];

  int get displayIndex => questions.isEmpty ? 0 : index.value + 1;
  bool get isLastQuestion =>
      questions.isNotEmpty && index.value >= questions.length - 1;

  @override
  void onInit() {
    super.onInit();
    subject = Get.parameters['subject'] ?? '';
    session = Get.parameters['session'] ?? '';
    _remote = Get.find<ExamRemoteRepository>();
    _progress = Get.find<ExamProgressRepository>();
    _toolbar = Get.find<ExamSheetToolbarController>();
    _load();
    ever(index, (_) => _persistProgress());
    ever(questions, (_) => _updateToolbar());
    ever(index, (_) => _updateToolbar());
    ever(loading, (_) => _updateToolbar());
  }

  @override
  void onClose() {
    _toolbar.clearSheetToolbar();
    super.onClose();
  }

  Future<void> _load() async {
    loading.value = true;
    loadError.value = '';
    try {
      final all = await _remote.fetchExamJson(session);
      final filtered = all
          .where((q) => q.subject == subject)
          .toList()
        ..sort((a, b) => a.questionNumber.compareTo(b.questionNumber));
      questions.assignAll(filtered);
      if (filtered.isNotEmpty) {
        index.value = _progress.readExamProgress(
          subject,
          session,
          filtered.length,
        );
      }
    } catch (e, st) {
      logExamError('AnswerSheetController._load', e, st);
      loadError.value = '문제를 불러오지 못했습니다: $e';
      showExamErrorToast('오류', loadError.value);
    } finally {
      loading.value = false;
      _updateToolbar();
    }
  }

  void _persistProgress() {
    if (questions.isNotEmpty) {
      _progress.writeExamProgress(subject, session, index.value);
    }
  }

  void _updateToolbar() {
    if (loading.value) {
      _toolbar.setSheetToolbarLines('$subject · $session', '');
      return;
    }
    final c = current;
    if (c == null || questions.isEmpty) {
      _toolbar.setSheetToolbarLines('$subject · $session', '');
      return;
    }
    _toolbar.setSheetToolbarLines(
      '${c.examType} ${c.subject} · $session',
      '$displayIndex(현재문항)/${questions.length}(총문항)',
    );
  }

  void prev() {
    if (index.value > 0) index.value--;
  }

  void advance() {
    if (index.value < questions.length - 1) {
      index.value++;
    }
  }

  void finishSessionCleanup() {
    _progress.incrementRepeatCount(subject, session);
    _progress.resetExamProgress(subject, session);
  }

  void goToSessionList() {
    Get.offNamed(Routes.sessions, parameters: {'subject': subject});
  }

  Future<void> goToNextSessionOrList() async {
    try {
      final manifest = await _remote.fetchExamSessionsManifest();
      final sessions = _remote.listSessionsFromManifest(manifest);
      final idx = sessions.indexOf(session);
      final nextSession =
          idx >= 0 && idx < sessions.length - 1 ? sessions[idx + 1] : null;
      if (nextSession == null) {
        showExamInfoToast('안내', '마지막 회차입니다.');
        goToSessionList();
        return;
      }
      Get.offNamed(
        Routes.sheet,
        parameters: {'subject': subject, 'session': nextSession},
      );
    } catch (e, st) {
      logExamError('AnswerSheetController.goToNextSessionOrList', e, st);
      goToSessionList();
    }
  }
}
