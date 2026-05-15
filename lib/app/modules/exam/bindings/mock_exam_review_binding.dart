import 'package:get/get.dart';

import '../controllers/mock_exam_review_controller.dart';

class MockExamReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(MockExamReviewController.new);
  }
}
