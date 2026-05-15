abstract class Routes {
  static const root = '/';
  static const main = '/main';
  static const options = '/options';
  static const sessions = '/sessions/:subject';
  static const sheet = '/sheet/:subject/:session';
  static const mock = '/mock/:subject';
  static const mockReview = '/mock-review/:subject/:endedAt';
  static const notFound = '/404';

  /// GetX nested 라우트는 `parameters`만으로 path가 치환되지 않을 수 있어
  /// 실제 경로 문자열을 만들어 `Get.toNamed`에 전달합니다.
  static String sessionsPath(String subject) =>
      '/sessions/${_encodeSegment(subject)}';

  static String sheetPath(String subject, String session) =>
      '/sheet/${_encodeSegment(subject)}/${_encodeSegment(session)}';

  static String mockPath(String subject) => '/mock/${_encodeSegment(subject)}';

  static String mockReviewPath(String subject, int endedAt) =>
      '/mock-review/${_encodeSegment(subject)}/$endedAt';

  static String _encodeSegment(String value) => Uri.encodeComponent(value);
}
