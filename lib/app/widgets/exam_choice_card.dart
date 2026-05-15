import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/exam_constants.dart';
import '../../data/models/exam.dart';
import '../../data/models/exam_user_options.dart';
import '../controllers/exam_user_options_controller.dart';
import 'exam_optional_remote_image.dart';

class ExamChoiceCard extends StatelessWidget {
  const ExamChoiceCard({
    super.key,
    required this.question,
    required this.choice,
    this.highlightCorrect = false,
    this.highlightSelected = false,
    this.highlightPending = false,
    this.showPickLabel = false,
    this.onTap,
  });

  final ExamQuestion question;
  final ExamChoice choice;
  final bool highlightCorrect;
  final bool highlightSelected;
  final bool highlightPending;
  final bool showPickLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final opts = Get.find<ExamUserOptionsController>();
    return Obx(() {
      final textSize = opts.options.value.questionTextSize;
      Color? bg;
      Color? fg;
      if (highlightCorrect) {
        bg = opts.correctBg;
        fg = opts.correctText;
      } else if (highlightSelected || highlightPending) {
        bg = opts.pickBg;
        fg = opts.pickText;
      }

      return Material(
        color: bg ?? Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${choice.no}. ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: choiceTextFontSize(textSize),
                                color: fg,
                              ),
                            ),
                            TextSpan(
                              text: choice.text,
                              style: TextStyle(
                                fontSize: choiceTextFontSize(textSize),
                                color: fg,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (showPickLabel)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          '(선택)',
                          style: TextStyle(
                            fontSize: choiceTextFontSize(textSize),
                            color: fg,
                          ),
                        ),
                      ),
                  ],
                ),
                ExamOptionalRemoteImage(
                  url: examChoiceImageUrl(question.id, choice.no),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
