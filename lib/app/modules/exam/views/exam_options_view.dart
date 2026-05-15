import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/exam_toast.dart';
import '../../../../data/models/exam_user_options.dart';
import '../../../controllers/exam_user_options_controller.dart';
import '../../../widgets/exam_choice_card.dart';
import '../../../widgets/exam_sheet_nav_toolbar.dart';
import '../../../../data/models/exam.dart';

class ExamOptionsView extends GetView<ExamUserOptionsController> {
  const ExamOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final o = controller.options.value;
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(context, '테마'),
          _themeRow(o.themeMode),
          const SizedBox(height: 8),
          _colorTile(
            context,
            '정답 하이라이트 배경',
            o.correctHighlightHex,
            () => _openColorDialog(context, 'correct', o.correctHighlightHex),
          ),
          _colorTile(
            context,
            '정답 하이라이트 글자 색',
            o.correctHighlightTextHex,
            () => _openColorDialog(context, 'correctText', o.correctHighlightTextHex),
          ),
          _colorTile(
            context,
            '모의고사 선택 보기 배경',
            o.pickChoiceHighlightHex,
            () => _openColorDialog(context, 'pick', o.pickChoiceHighlightHex),
          ),
          _colorTile(
            context,
            '모의고사 선택 보기 글자 색',
            o.pickChoiceHighlightTextHex,
            () => _openColorDialog(context, 'pickText', o.pickChoiceHighlightTextHex),
          ),
          const SizedBox(height: 16),
          _sectionTitle(context, '하단 버튼 영역 높이'),
          _toggleRow(
            ['보통', '크게', '더 크게'],
            [
              StickyButtonHeight.normal,
              StickyButtonHeight.large,
              StickyButtonHeight.xlarge,
            ],
            o.stickyButtonHeight,
            (v) => controller.setStickyButtonHeight(v),
          ),
          const SizedBox(height: 16),
          _sectionTitle(context, '문제 글자 크기'),
          _toggleRow(
            ['아주 작게', '작게', '보통', '크게', '최대'],
            [
              QuestionTextSize.sm,
              QuestionTextSize.md,
              QuestionTextSize.lg,
              QuestionTextSize.xl,
              QuestionTextSize.max,
            ],
            o.questionTextSize,
            (v) => controller.setQuestionTextSize(v),
          ),
          const SizedBox(height: 16),
          _sectionTitle(context, '하단 버튼 순서'),
          SegmentedButton<StickyButtonOrder>(
            segments: const [
              ButtonSegment(
                value: StickyButtonOrder.prevNext,
                label: Text('이전 | 다음'),
              ),
              ButtonSegment(
                value: StickyButtonOrder.nextPrev,
                label: Text('다음 | 이전'),
              ),
            ],
            selected: {o.stickyButtonOrder},
            onSelectionChanged: (s) =>
                controller.setStickyButtonOrder(s.first),
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '답안지 화면 미리보기'),
          ShadCard(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '1. (예시) 시험 문제 본문은 위에서 선택한 글자 크기로 표시됩니다.',
                        style: TextStyle(
                          fontSize: questionTextFontSize(o.questionTextSize),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ExamChoiceCard(
                        question: _sampleQuestion,
                        choice: _sampleQuestion.choices[0],
                      ),
                      const SizedBox(height: 8),
                      ExamChoiceCard(
                        question: _sampleQuestion,
                        choice: _sampleQuestion.choices[1],
                        highlightCorrect: true,
                      ),
                      const SizedBox(height: 8),
                      ExamChoiceCard(
                        question: _sampleQuestion,
                        choice: _sampleQuestion.choices[2],
                        highlightSelected: true,
                      ),
                    ],
                  ),
                ),
                ExamSheetNavToolbar(
                  prevDisabled: false,
                  nextDisabled: false,
                  onPrev: () {},
                  onNext: () {},
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  static final _sampleQuestion = ExamQuestion(
    id: 'preview',
    examType: '예시',
    examSession: 'preview',
    subject: '예시',
    questionNumber: 1,
    questionText: '예시',
    choices: const [
      ExamChoice(no: 1, text: '첫 번째 보기 문장입니다.'),
      ExamChoice(no: 2, text: '정답 보기(배경·글자 색)'),
      ExamChoice(no: 3, text: '모의고사에서 고른 보기(배경·글자 색)'),
    ],
    correctAnswer: 2,
  );

  Widget _sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _themeRow(ExamThemeMode current) {
    return Wrap(
      spacing: 8,
      children: [
        _chip('시스템', ExamThemeMode.system, current),
        _chip('라이트', ExamThemeMode.light, current),
        _chip('다크', ExamThemeMode.dark, current),
      ],
    );
  }

  Widget _chip(String label, ExamThemeMode value, ExamThemeMode current) {
    return ChoiceChip(
      label: Text(label),
      selected: current == value,
      onSelected: (_) => controller.setThemeMode(value),
    );
  }

  Widget _colorTile(
    BuildContext context,
    String title,
    String hex,
    VoidCallback onTap,
  ) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: colorFromHex(hex),
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _toggleRow<T>(
    List<String> labels,
    List<T> values,
    T current,
    ValueChanged<T> onChanged,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(labels.length, (i) {
        return ChoiceChip(
          label: Text(labels[i]),
          selected: current == values[i],
          onSelected: (_) => onChanged(values[i]),
        );
      }),
    );
  }

  Future<void> _openColorDialog(
    BuildContext context,
    String kind,
    String initial,
  ) async {
    final draft = initial.obs;
    await Get.dialog(
      AlertDialog(
        title: Text(_colorTitle(kind)),
        content: TextField(
          controller: TextEditingController(text: initial)
            ..selection = TextSelection.collapsed(offset: initial.length),
          onChanged: (v) => draft.value = v,
          decoration: const InputDecoration(
            labelText: '#RRGGBB',
            hintText: '#ffcccc',
          ),
        ),
        actions: [
          TextButton(onPressed: Get.back, child: const Text('취소')),
          TextButton(
            onPressed: () async {
              final hex = draft.value;
              if (!RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(hex)) {
                showExamErrorToast('오류', '올바른 HEX 색상을 입력하세요.');
                return;
              }
              switch (kind) {
                case 'correct':
                  await controller.setCorrectHighlightHex(hex);
                case 'correctText':
                  await controller.setCorrectHighlightTextHex(hex);
                case 'pick':
                  await controller.setPickChoiceHighlightHex(hex);
                case 'pickText':
                  await controller.setPickChoiceHighlightTextHex(hex);
              }
              Get.back();
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  String _colorTitle(String kind) {
    switch (kind) {
      case 'correct':
        return '정답 하이라이트 배경';
      case 'correctText':
        return '정답 하이라이트 글자 색';
      case 'pick':
        return '모의고사 선택 보기 배경';
      case 'pickText':
        return '모의고사 선택 보기 글자 색';
      default:
        return '색상';
    }
  }
}
