import 'package:flutter_test/flutter_test.dart';
import 'package:jootaek_exam/data/models/exam_user_options.dart';

void main() {
  test('normalizeExamUserOptions keeps defaults for invalid hex', () {
    const partial = ExamUserOptions(correctHighlightHex: 'invalid');
    final result = normalizeExamUserOptions(partial);
    expect(result.correctHighlightHex, defaultExamUserOptions.correctHighlightHex);
  });
}
