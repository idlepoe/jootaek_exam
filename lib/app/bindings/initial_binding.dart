import 'package:get/get.dart';

import '../controllers/exam_sheet_toolbar_controller.dart';
import '../controllers/mock_exam_toolbar_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExamSheetToolbarController(), permanent: true);
    Get.put(MockExamToolbarController(), permanent: true);
  }
}
