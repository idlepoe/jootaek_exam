import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/exam_constants.dart';
import '../../../../data/models/mock_exam.dart';
import '../../../routes/app_routes.dart';
import '../controllers/main_subject_controller.dart';

class MainSubjectView extends GetView<MainSubjectController> {
  const MainSubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.now.value;
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Text('회독', style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _confirmClearReading(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...examSubjects.map(
            (sub) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ShadButton.outline(
                width: double.infinity,
                onPressed: () => Get.toNamed(Routes.sessionsPath(sub)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(sub),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('모의고사', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...examSubjects.expand((sub) {
            final items = <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ShadButton.secondary(
                  width: double.infinity,
                  onPressed: () => Get.toNamed(
                    Routes.mock,
                    parameters: {'subject': sub},
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(sub),
                  ),
                ),
              ),
            ];
            if (controller.mockBannerFor(sub)) {
              final s = controller.mockSession.value!;
              items.add(_MockBannerCard(
                subject: sub,
                session: s,
                displayIndex: controller.displayCurrentIndex,
                answeredCount: controller.answeredCount,
                total: s.questions.length,
                elapsed: controller.elapsedLabel,
                onResume: () => Get.toNamed(
                  Routes.mock,
                  parameters: {'subject': sub},
                ),
                onEnd: () => _confirmEndMock(context),
              ));
            }
            return items;
          }),
          const SizedBox(height: 24),
          Row(
            children: [
              Text('모의고사 이력', style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: controller.mockHistory.isEmpty
                    ? null
                    : () => _confirmClearHistory(context),
              ),
            ],
          ),
          const Divider(),
          if (controller.mockHistory.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text('저장된 모의고사 이력이 없습니다.'),
            )
          else
            ...controller.mockHistory.map(
              (e) => _HistoryCard(
                entry: e,
                onTap: () => Get.toNamed(
                  Routes.mockReview,
                  parameters: {
                    'subject': e.subject,
                    'endedAt': e.endedAt.toString(),
                  },
                ),
              ),
            ),
        ],
      );
    });
  }

  void _confirmClearReading(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('회독 초기화'),
        content: const Text(
          '모든 과목·회차의 회독 진행 위치와 회독 횟수를 초기화할까요? 이 작업은 되돌릴 수 없습니다.',
        ),
        actions: [
          TextButton(onPressed: Get.back, child: const Text('취소')),
          TextButton(
            onPressed: () {
              Get.back();
              controller.clearReadingProgress();
            },
            child: const Text('초기화'),
          ),
        ],
      ),
    );
  }

  void _confirmClearHistory(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('이력 삭제'),
        content: const Text('모든 모의고사 이력을 삭제할까요?'),
        actions: [
          TextButton(onPressed: Get.back, child: const Text('취소')),
          TextButton(
            onPressed: () {
              Get.back();
              controller.clearMockHistory();
            },
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }

  void _confirmEndMock(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('모의고사 종료'),
        content: const Text('진행 중인 모의고사를 삭제하고 종료할까요?'),
        actions: [
          TextButton(onPressed: Get.back, child: const Text('취소')),
          TextButton(
            onPressed: () {
              Get.back();
              controller.endMockExam();
            },
            child: const Text('종료'),
          ),
        ],
      ),
    );
  }
}

class _MockBannerCard extends StatelessWidget {
  const _MockBannerCard({
    required this.subject,
    required this.session,
    required this.displayIndex,
    required this.answeredCount,
    required this.total,
    required this.elapsed,
    required this.onResume,
    required this.onEnd,
  });

  final String subject;
  final dynamic session;
  final int displayIndex;
  final int answeredCount;
  final int total;
  final String elapsed;
  final VoidCallback onResume;
  final VoidCallback onEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ShadCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('진행 중인 모의고사 ($subject)',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Text('현재 $displayIndex / 총 $total문항'),
              Text('작성 완료 $answeredCount / $total문항'),
              Text('경과 $elapsed', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ShadButton(
                      onPressed: onResume,
                      child: const Text('이어서 풀기'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ShadButton.outline(
                      onPressed: onEnd,
                      child: const Text('모의고사 종료하기'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.entry, required this.onTap});

  final MockExamHistoryEntry entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final score = MainSubjectController.historyScorePercent(entry);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ShadCard(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(entry.subject,
                        style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    Text(
                      entry.isPassed ? '합격' : '불합격',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: entry.isPassed ? null : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('시작: ${MainSubjectController.formatHistoryStart(entry)}'),
                Text(
                    '경과: ${MainSubjectController.formatHistoryElapsed(entry)}'),
                Text(
                    '문항 ${entry.questions.length} · 정답 ${entry.correctCount}'),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('$score점',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
