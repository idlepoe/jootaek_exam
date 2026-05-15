import 'package:get/get.dart';

import '../controllers/answer_sheet_controller.dart';

class AnswerSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AnswerSheetController.new);
  }
}
