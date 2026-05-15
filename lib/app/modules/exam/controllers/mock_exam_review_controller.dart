import 'package:get/get.dart';

import '../../../../core/exam_log.dart';
import '../../../../core/exam_toast.dart';
import '../../../../data/models/exam.dart';
import '../../../../data/repositories/mock_exam_storage_repository.dart';
import '../../../controllers/exam_sheet_toolbar_controller.dart';
import '../../../routes/app_routes.dart';

class MockExamReviewController extends GetxController {
  final loading = true.obs;
  final loadError = ''.obs;
  final questions = <ExamQuestion>[].obs;
  final answers = <int?>[].obs;
  final index = 0.obs;

  late final String subject;
  late final int endedAt;
  late final MockExamStorageRepository _storage;
  late final ExamSheetToolbarController _toolbar;

  ExamQuestion? get current =>
      questions.isEmpty ? null : questions[index.value];

  int? get userAnswer =>
      questions.isEmpty ? null : answers[index.value];

  int get displayIndex => questions.isEmpty ? 0 : index.value + 1;

  @override
  void onInit() {
    super.onInit();
    subject = Get.parameters['subject'] ?? '';
    endedAt = int.tryParse(Get.parameters['endedAt'] ?? '') ?? -1;
    _storage = Get.find<MockExamStorageRepository>();
    _toolbar = Get.find<ExamSheetToolbarController>();
    _load();
    ever(index, (_) => _updateToolbar());
    ever(questions, (_) => _updateToolbar());
  }

  @override
  void onClose() {
    _toolbar.clearSheetToolbar();
    super.onClose();
  }

  void _load() {
    loading.value = true;
    loadError.value = '';
    if (endedAt < 0) {
      loadError.value = '잘못된 이력 링크입니다.';
      showExamErrorToast('오류', loadError.value);
      Get.offNamed(Routes.main);
      loading.value = false;
      return;
    }
    final matches = _storage
        .readMockHistory()
        .where((e) => e.subject == subject && e.endedAt == endedAt)
        .toList();
    final entry = matches.isEmpty ? null : matches.first;
    try {
      if (entry == null || entry.questions.isEmpty) throw StateError('empty');
      questions.assignAll(entry.questions);
      final n = entry.questions.length;
      final raw = entry.answers;
      answers.assignAll(
        raw.length == n
            ? raw
            : List.generate(n, (i) => i < raw.length ? raw[i] : null),
      );
      index.value = 0;
    } catch (e, st) {
      logExamError('MockExamReviewController._load', e, st);
      loadError.value = '모의고사 이력을 찾을 수 없습니다.';
      showExamWarningToast('경고', loadError.value);
      Get.offNamed(Routes.main);
    } finally {
      loading.value = false;
      _updateToolbar();
    }
  }

  void _updateToolbar() {
    final c = current;
    if (c == null || questions.isEmpty) {
      _toolbar.setSheetToolbarLines('', '');
      return;
    }
    _toolbar.setSheetToolbarLines(
      '${c.examType} ${c.subject}',
      '$displayIndex(현재문항)/${questions.length}(총문항)',
    );
  }

  bool highlightCorrect(int no) => current?.correctAnswer == no;

  bool highlightSelected(int no) {
    final q = current;
    final ua = userAnswer;
    return q != null && ua != null && no == ua && ua != q.correctAnswer;
  }

  bool showPickLabel(int no) {
    final q = current;
    final ua = userAnswer;
    return q != null && ua != null && no == ua && ua != q.correctAnswer;
  }

  void prev() {
    if (index.value > 0) index.value--;
  }

  void next() {
    if (index.value < questions.length - 1) index.value++;
  }
}
