import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/exam_constants.dart';
import '../../../controllers/exam_user_options_controller.dart';
import '../../../widgets/exam_choice_card.dart';
import '../../../widgets/exam_optional_remote_image.dart';
import '../../../widgets/exam_sheet_nav_toolbar.dart';
import '../controllers/answer_sheet_controller.dart';
import '../../../../data/models/exam_user_options.dart';

class AnswerSheetView extends GetView<AnswerSheetController> {
  const AnswerSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final opts = Get.find<ExamUserOptionsController>();
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final q = controller.current;
      return Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            children: [
              if (q != null) ...[
                Text(
                  '${controller.displayIndex}. ${q.questionText}',
                  style: TextStyle(
                    fontSize: questionTextFontSize(
                      opts.options.value.questionTextSize,
                    ),
                    height: 1.4,
                  ),
                ),
                ExamOptionalRemoteImage(url: examQuestionImageUrl(q.id)),
                const SizedBox(height: 16),
                ...q.choices.map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ExamChoiceCard(
                      question: q,
                      choice: c,
                      highlightCorrect: c.no == q.correctAnswer,
                    ),
                  ),
                ),
              ] else if (controller.loadError.value.isEmpty &&
                  controller.questions.isEmpty)
                const Text('이 회차·과목에 해당하는 문항이 없습니다.'),
              if (controller.loadError.value.isNotEmpty)
                Text(
                  controller.loadError.value,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
            ],
          ),
          if (controller.questions.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ExamSheetNavToolbar(
                prevDisabled: controller.index.value <= 0,
                nextDisabled: false,
                onPrev: controller.prev,
                onNext: () => _onNext(context),
              ),
            ),
        ],
      );
    });
  }

  Future<void> _onNext(BuildContext context) async {
    if (!controller.isLastQuestion) {
      controller.advance();
      return;
    }
    final goList = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('안내'),
        content: const Text('문제를 모두 확인했습니다.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('목록으로 돌아가기'),
          ),
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('다음 회차로'),
          ),
        ],
      ),
    );
    controller.finishSessionCleanup();
    if (goList == true) {
      controller.goToSessionList();
    } else {
      await controller.goToNextSessionOrList();
    }
  }
}
