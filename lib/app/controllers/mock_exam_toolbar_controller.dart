import 'package:get/get.dart';

class MockExamToolbarController extends GetxController {
  final timerLabel = '\u00a0'.obs;
  final line1 = ''.obs;
  final line2 = ''.obs;
  final submitNonce = 0.obs;
  final reviewNonce = 0.obs;

  void setTimerLabel(String s) {
    timerLabel.value = s.isEmpty ? '\u00a0' : s;
  }

  void setMockToolbarLines(String a, String b) {
    line1.value = a;
    line2.value = b;
  }

  void requestSubmit() => submitNonce.value++;

  void requestAnswerReview() => reviewNonce.value++;

  void clearToolbar() {
    timerLabel.value = '\u00a0';
    line1.value = '';
    line2.value = '';
    submitNonce.value = 0;
    reviewNonce.value = 0;
  }
}
