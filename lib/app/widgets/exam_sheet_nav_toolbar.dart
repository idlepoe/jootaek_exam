import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../data/models/exam_user_options.dart';
import '../controllers/exam_user_options_controller.dart';

class ExamSheetNavToolbar extends StatelessWidget {
  const ExamSheetNavToolbar({
    super.key,
    required this.prevDisabled,
    required this.nextDisabled,
    required this.onPrev,
    required this.onNext,
  });

  final bool prevDisabled;
  final bool nextDisabled;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final opts = Get.find<ExamUserOptionsController>();
    return Obx(() {
      final height = navToolbarHeight(opts.options.value.stickyButtonHeight);
      final order = opts.options.value.stickyButtonOrder;
      final isDark = Theme.of(context).brightness == Brightness.dark;

      Widget prevBtn() => Expanded(
            child: SizedBox(
              height: height,
              child: ShadButton.outline(
                onPressed: prevDisabled ? null : onPrev,
                child: const Text('이전'),
              ),
            ),
          );

      Widget nextBtn() => Expanded(
            child: SizedBox(
              height: height,
              child: ShadButton(
                onPressed: nextDisabled ? null : onNext,
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: isDark ? null : Colors.white,
                  ),
                ),
              ),
            ),
          );

      return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Row(
            children: order == StickyButtonOrder.prevNext
                ? [prevBtn(), const SizedBox(width: 10), nextBtn()]
                : [nextBtn(), const SizedBox(width: 10), prevBtn()],
          ),
        ),
      );
    });
  }
}
