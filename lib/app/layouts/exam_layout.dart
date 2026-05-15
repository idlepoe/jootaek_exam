import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../controllers/exam_sheet_toolbar_controller.dart';
import '../controllers/mock_exam_toolbar_controller.dart';
import '../routes/app_routes.dart';

class ExamLayout extends StatelessWidget {
  const ExamLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final route = Get.routing.current;
    final sheetToolbar = Get.find<ExamSheetToolbarController>();
    final mockToolbar = Get.find<MockExamToolbarController>();

    final showBack = route == Routes.options ||
        route.startsWith('/sessions') ||
        route.startsWith('/sheet') ||
        route.startsWith('/mock');

    String title = '';
    if (route == Routes.main) {
      title = '광고없는주택관리사1차기출회독';
    } else if (route == Routes.options) {
      title = '설정';
    } else if (route.startsWith('/sessions')) {
      title = '회독 ${Get.parameters['subject'] ?? ''}';
    }

    return Scaffold(
      appBar: AppBar(
        leading: showBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => _goBack(route),
              )
            : null,
        title: _buildTitle(
          context,
          route,
          title,
          sheetToolbar,
          mockToolbar,
        ),
        actions: [
          if (route == Routes.main)
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Get.toNamed(Routes.options),
            ),
        ],
      ),
      body: GetRouterOutlet(
        initialRoute: Routes.main,
        anchorRoute: '/',
      ),
    );
  }

  void _goBack(String route) {
    if (route == Routes.options) {
      Get.offNamed(Routes.main);
      return;
    }
    if (route.startsWith('/sessions')) {
      Get.offNamed(Routes.main);
      return;
    }
    if (route.startsWith('/sheet')) {
      final subject = Get.parameters['subject'] ?? '';
      Get.offNamed(Routes.sessions, parameters: {'subject': subject});
      return;
    }
    if (route.startsWith('/mock-review')) {
      Get.offNamed(Routes.main);
      return;
    }
    if (route.startsWith('/mock')) {
      Get.offNamed(Routes.main);
    }
  }

  Widget _buildTitle(
    BuildContext context,
    String route,
    String title,
    ExamSheetToolbarController sheetToolbar,
    MockExamToolbarController mockToolbar,
  ) {
    if (route.startsWith('/sheet') || route.startsWith('/mock-review')) {
      return Obx(() => _twoLineTitle(sheetToolbar.line1.value, sheetToolbar.line2.value));
    }
    if (route.startsWith('/mock') && !route.startsWith('/mock-review')) {
      return Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _twoLineTitle(mockToolbar.line1.value, mockToolbar.line2.value),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      mockToolbar.timerLabel.value,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ShadButton.ghost(
                    onPressed: mockToolbar.requestSubmit,
                    size: ShadButtonSize.sm,
                    child: const Text('답안제출'),
                  ),
                  ShadButton.ghost(
                    onPressed: mockToolbar.requestAnswerReview,
                    size: ShadButtonSize.sm,
                    child: const Text('답안 확인'),
                  ),
                ],
              ),
            ],
          ));
    }
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }

  Widget _twoLineTitle(String line1, String line2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(line1.isEmpty ? '\u00a0' : line1, overflow: TextOverflow.ellipsis),
        Text(
          line2.isEmpty ? '\u00a0' : line2,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
