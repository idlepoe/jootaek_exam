import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exam_log.dart';
import '../../../../core/exam_toast.dart';
import '../../../../data/models/exam.dart';
import '../../../../data/models/mock_exam.dart';
import '../../../../data/repositories/exam_remote_repository.dart';
import '../../../../data/repositories/mock_exam_storage_repository.dart';
import '../../../controllers/mock_exam_toolbar_controller.dart';
import '../../../routes/app_routes.dart';

class MockExamController extends GetxController {
  final loading = true.obs;
  final loadError = ''.obs;
  final questions = <ExamQuestion>[].obs;
  final answers = <int?>[].obs;
  final startedAt = 0.obs;
  final currentIndex = 0.obs;
  final pendingChoice = Rxn<int>();
  final pendingAdvance = false.obs;
  final answerReviewOpen = false.obs;

  late final String subject;
  late final ExamRemoteRepository _remote;
  late final MockExamStorageRepository _storage;
  late final MockExamToolbarController _toolbar;

  Timer? _advanceTimer;
  Timer? _wallTimer;
  int _lastSubmitNonce = 0;
  int _lastReviewNonce = 0;

  ExamQuestion? get current => questions.isEmpty
      ? null
      : questions[currentIndex.value];

  int get displayIndex =>
      questions.isEmpty ? 0 : currentIndex.value + 1;

  @override
  void onInit() {
    super.onInit();
    subject = Get.parameters['subject'] ?? '';
    _remote = Get.find<ExamRemoteRepository>();
    _storage = Get.find<MockExamStorageRepository>();
    _toolbar = Get.find<MockExamToolbarController>();
    _toolbar.clearToolbar();
    _lastSubmitNonce = _toolbar.submitNonce.value;
    _lastReviewNonce = _toolbar.reviewNonce.value;
    _load();

    ever(_toolbar.submitNonce, (n) {
      if (n <= _lastSubmitNonce) return;
      _lastSubmitNonce = n;
      if (questions.isEmpty || loading.value) return;
      openExamEndDialogs();
    });
    ever(_toolbar.reviewNonce, (n) {
      if (n <= _lastReviewNonce) return;
      _lastReviewNonce = n;
      if (questions.isEmpty || loading.value) return;
      answerReviewOpen.value = true;
    });
    ever(questions, (_) => _persist());
    ever(answers, (_) => _persist());
    ever(currentIndex, (_) => _persist());
    ever(questions, (_) => _updateToolbar());
    ever(currentIndex, (_) => _updateToolbar());
    ever(loading, (_) => _updateToolbar());
  }

  @override
  void onClose() {
    _advanceTimer?.cancel();
    _wallTimer?.cancel();
    _toolbar.clearToolbar();
    super.onClose();
  }

  Future<void> _load() async {
    loading.value = true;
    loadError.value = '';
    try {
      final saved = _storage.readCurrentMockExam();
      if (saved != null &&
          saved.subject == subject &&
          saved.questions.isNotEmpty) {
        questions.assignAll(saved.questions);
        answers.assignAll(
          saved.answers.length == saved.questions.length
              ? saved.answers
              : saved.questions.map((_) => null).toList(),
        );
        startedAt.value = saved.startedAt;
        currentIndex.value = saved.currentIndex.clamp(
          0,
          saved.questions.length - 1,
        );
      } else {
        if (saved != null) await _storage.clearCurrentMockExam();
        final q = await _remote.buildMockExamQuestions(subject);
        if (q.isEmpty) {
          loadError.value = '해당 과목 문항이 없습니다.';
          return;
        }
        questions.assignAll(q);
        answers.assignAll(List.filled(q.length, null));
        startedAt.value = DateTime.now().millisecondsSinceEpoch;
        currentIndex.value = 0;
      }
      _wallTimer = Timer.periodic(
        const Duration(milliseconds: 250),
        (_) => updateTimerLabel(),
      );
      updateTimerLabel();
    } catch (e, st) {
      logExamError('MockExamController._load', e, st);
      loadError.value = '문항을 불러오지 못했습니다: $e';
      showExamErrorToast('오류', loadError.value);
    } finally {
      loading.value = false;
      _updateToolbar();
    }
  }

  void _persist() {
    if (questions.isEmpty || startedAt.value == 0) return;
    _storage.writeCurrentMockExam(
      MockExamState(
        subject: subject,
        questions: questions.toList(),
        answers: answers.toList(),
        startedAt: startedAt.value,
        currentIndex: currentIndex.value,
      ),
    );
  }

  void _updateToolbar() {
    if (loading.value) {
      _toolbar.setMockToolbarLines('', '');
      return;
    }
    final c = current;
    if (c == null || questions.isEmpty) {
      _toolbar.setMockToolbarLines('', '');
      return;
    }
    _toolbar.setMockToolbarLines(
      '${c.examType} ${c.subject}',
      '$displayIndex(현재문항)/${questions.length}(총문항)',
    );
  }

  void updateTimerLabel() {
    final n = questions.length;
    if (n == 0 || startedAt.value == 0) {
      _toolbar.setTimerLabel('');
      return;
    }
    final elapsed =
        DateTime.now().millisecondsSinceEpoch - startedAt.value;
    final m = elapsed ~/ 60000;
    final s = (elapsed % 60000) ~/ 1000;
    _toolbar.setTimerLabel('$m:${s.toString().padLeft(2, '0')} / $n분');
  }

  List<int> getUnansweredIndices() {
    final out = <int>[];
    for (var i = 0; i < answers.length; i++) {
      if (answers[i] == null) out.add(i);
    }
    return out;
  }

  ({int correctCount, bool isPassed}) scoreExam() {
    var correct = 0;
    for (var i = 0; i < questions.length; i++) {
      final a = answers[i];
      if (a != null && questions[i].correctAnswer == a) correct++;
    }
    final total = questions.length;
    final need = (total * 0.6).ceil();
    return (correctCount: correct, isPassed: correct >= need);
  }

  Future<void> showScoreAndFinish() async {
    final result = scoreExam();
    final total = questions.length;
    await Get.dialog(
      AlertDialog(
        title: const Text('채점 결과'),
        content: Text(
          '${result.isPassed ? '합격' : '불합격'}\n정답: ${result.correctCount} / $total',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _storage.appendMockHistory(
                MockExamHistoryEntry(
                  subject: subject,
                  questions: questions.toList(),
                  answers: answers.toList(),
                  startedAt: startedAt.value,
                  endedAt: DateTime.now().millisecondsSinceEpoch,
                  correctCount: result.correctCount,
                  isPassed: result.isPassed,
                ),
              );
              await _storage.clearCurrentMockExam();
              _toolbar.clearToolbar();
              Get.back();
              Get.offNamed(Routes.main);
            },
            child: const Text('확인'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void openExamEndDialogs() {
    if (questions.isEmpty) return;
    final unanswered = getUnansweredIndices();
    if (unanswered.isNotEmpty) {
      Get.dialog(
        AlertDialog(
          title: const Text('미작성 문항'),
          content: Text('미작성 문항이 ${unanswered.length}개 있습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                currentIndex.value = unanswered.first;
                Get.back();
              },
              child: const Text('풀러 가기'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                showScoreAndFinish();
              },
              child: const Text('채점하기'),
            ),
          ],
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text('안내'),
          content: const Text('답안을 제출하시겠습니까?'),
          actions: [
            TextButton(onPressed: Get.back, child: const Text('취소')),
            TextButton(
              onPressed: () {
                Get.back();
                showScoreAndFinish();
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  void pickChoice(int no) {
    if (pendingAdvance.value || loading.value) return;
    pendingChoice.value = no;
    pendingAdvance.value = true;
    _advanceTimer?.cancel();
    _advanceTimer = Timer(const Duration(milliseconds: 500), () {
      answers[currentIndex.value] = no;
      pendingChoice.value = null;
      pendingAdvance.value = false;
      if (currentIndex.value >= questions.length - 1) {
        openExamEndDialogs();
      } else {
        currentIndex.value++;
      }
    });
  }

  void goToReviewIndex(int i) {
    _advanceTimer?.cancel();
    pendingChoice.value = null;
    pendingAdvance.value = false;
    final max = questions.isEmpty ? 0 : questions.length - 1;
    currentIndex.value = i.clamp(0, max);
    answerReviewOpen.value = false;
    updateTimerLabel();
  }

  void prev() {
    if (currentIndex.value > 0) currentIndex.value--;
  }

  void next() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      return;
    }
    openExamEndDialogs();
  }

  bool choiceIsSelected(int no) => answers[currentIndex.value] == no;
  bool choiceIsPending(int no) => pendingChoice.value == no;
}
