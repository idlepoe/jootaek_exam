import 'dart:developer' as developer;

/// 시험 앱 오류를 개발자 로그에 기록합니다.
void logExamError(String context, Object error, [StackTrace? stackTrace]) {
  developer.log(
    context,
    error: error,
    stackTrace: stackTrace,
    name: 'jootaek_exam',
  );
}
