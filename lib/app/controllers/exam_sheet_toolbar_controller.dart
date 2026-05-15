import 'package:get/get.dart';

class ExamSheetToolbarController extends GetxController {
  final line1 = ''.obs;
  final line2 = ''.obs;

  void setSheetToolbarLines(String a, String b) {
    line1.value = a;
    line2.value = b;
  }

  void clearSheetToolbar() {
    line1.value = '';
    line2.value = '';
  }
}
