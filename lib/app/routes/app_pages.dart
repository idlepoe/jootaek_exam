import 'package:get/get.dart';

import '../layouts/exam_layout.dart';
import '../modules/exam/bindings/answer_sheet_binding.dart';
import '../modules/exam/bindings/exam_options_binding.dart';
import '../modules/exam/bindings/main_subject_binding.dart';
import '../modules/exam/bindings/mock_exam_binding.dart';
import '../modules/exam/bindings/mock_exam_review_binding.dart';
import '../modules/exam/bindings/session_list_binding.dart';
import '../modules/exam/views/answer_sheet_view.dart';
import '../modules/exam/views/error_not_found_view.dart';
import '../modules/exam/views/exam_options_view.dart';
import '../modules/exam/views/main_subject_view.dart';
import '../modules/exam/views/mock_exam_review_view.dart';
import '../modules/exam/views/mock_exam_view.dart';
import '../modules/exam/views/session_list_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.root;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.root,
      page: () => const ExamLayout(),
      participatesInRootNavigator: true,
      children: [
        GetPage(
          name: Routes.main,
          page: () => const MainSubjectView(),
          binding: MainSubjectBinding(),
        ),
        GetPage(
          name: Routes.options,
          page: () => const ExamOptionsView(),
          binding: ExamOptionsBinding(),
        ),
        GetPage(
          name: Routes.sessions,
          page: () => const SessionListView(),
          binding: SessionListBinding(),
        ),
        GetPage(
          name: Routes.sheet,
          page: () => const AnswerSheetView(),
          binding: AnswerSheetBinding(),
        ),
        GetPage(
          name: Routes.mock,
          page: () => const MockExamView(),
          binding: MockExamBinding(),
        ),
        GetPage(
          name: Routes.mockReview,
          page: () => const MockExamReviewView(),
          binding: MockExamReviewBinding(),
        ),
      ],
    ),
    GetPage(
      name: Routes.notFound,
      page: () => const ErrorNotFoundView(),
    ),
  ];
}
