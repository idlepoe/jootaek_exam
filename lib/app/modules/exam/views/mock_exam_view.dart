import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exam_constants.dart';
import '../../../controllers/exam_user_options_controller.dart';
import '../../../widgets/exam_choice_card.dart';
import '../../../widgets/exam_optional_remote_image.dart';
import '../../../widgets/exam_sheet_nav_toolbar.dart';
import '../controllers/mock_exam_controller.dart';
import '../../../../data/models/exam_user_options.dart';

class MockExamView extends GetView<MockExamController> {
  const MockExamView({super.key});

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
                      highlightSelected: controller.choiceIsSelected(c.no),
                      highlightPending: controller.choiceIsPending(c.no),
                      onTap: () => controller.pickChoice(c.no),
                    ),
                  ),
                ),
              ] else if (controller.loadError.value.isEmpty &&
                  controller.questions.isEmpty)
                const Text('모의고사 문항을 만들 수 없습니다.'),
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
                prevDisabled: controller.currentIndex.value <= 0,
                nextDisabled: false,
                onPrev: controller.prev,
                onNext: controller.next,
              ),
            ),
          if (controller.answerReviewOpen.value) _AnswerReviewSheet(controller),
        ],
      );
    });
  }
}

class _AnswerReviewSheet extends StatelessWidget {
  const _AnswerReviewSheet(this.controller);

  final MockExamController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () => controller.answerReviewOpen.value = false,
        child: Container(
          color: Colors.black54,
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Material(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.92,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.72,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text('답안 확인',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () =>
                                controller.answerReviewOpen.value = false,
                          ),
                        ],
                      ),
                      Flexible(
                        child: Obx(() {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              const Row(
                                children: [
                                  SizedBox(width: 32, child: Text('#')),
                                  Expanded(child: Text('문제')),
                                  SizedBox(
                                      width: 56,
                                      child: Text('답안',
                                          textAlign: TextAlign.right)),
                                ],
                              ),
                              ...List.generate(controller.questions.length, (i) {
                                final q = controller.questions[i];
                                final ans = controller.answers[i];
                                final line = q.questionText
                                    .split(RegExp(r'\r?\n'))
                                    .first
                                    .replaceAll(RegExp(r'\s+'), ' ')
                                    .trim();
                                return InkWell(
                                  onTap: () => controller.goToReviewIndex(i),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 32, child: Text('${i + 1}')),
                                        Expanded(
                                          child: Text(
                                            line,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 56,
                                          child: Text(
                                            ans == null ? '미작성' : '$ans',
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
