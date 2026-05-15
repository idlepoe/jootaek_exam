import 'package:get/get.dart';

import '../controllers/main_subject_controller.dart';

class MainSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(MainSubjectController.new, fenix: true);
  }
}
