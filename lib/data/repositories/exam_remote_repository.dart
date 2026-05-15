import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

import '../../core/exam_constants.dart';
import '../models/exam.dart';

class ExamRemoteRepository {
  ExamRemoteRepository({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;
  final Map<String, Future<List<ExamQuestion>>> _jsonCache = {};
  Future<ExamSessionsManifest>? _sessionsManifestFuture;

  Future<ExamSessionsManifest> fetchExamSessionsManifest() {
    return _sessionsManifestFuture ??= _fetchJson<ExamSessionsManifest>(
      examSessionsManifestUrl(),
      (json) => ExamSessionsManifest.fromJson(json as Map<String, dynamic>),
    );
  }

  List<String> listSessionsFromManifest(ExamSessionsManifest manifest) =>
      [...manifest.sessions];

  Future<List<ExamQuestion>> fetchExamJson(String examSession) {
    final cached = _jsonCache[examSession];
    if (cached != null) return cached;
    final future = _fetchJson<List<ExamQuestion>>(
      examJsonUrl(examSession),
      (json) => (json as List<dynamic>)
          .map((e) => ExamQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    _jsonCache[examSession] = future;
    return future;
  }

  Future<List<ExamQuestion>> fetchAllQuestionsForSubject(String subject) async {
    final manifest = await fetchExamSessionsManifest();
    final sessions = listSessionsFromManifest(manifest);
    final arrays = await Future.wait(sessions.map(fetchExamJson));
    final flat = arrays
        .expand((list) => list)
        .where((q) => q.subject == subject)
        .toList();
    final byId = <String, ExamQuestion>{};
    for (final q in flat) {
      byId[q.id] = q;
    }
    return byId.values.toList();
  }

  Future<List<ExamQuestion>> buildMockExamQuestions(String subject) async {
    final pool = await fetchAllQuestionsForSubject(subject);
    return _shuffleTake(pool, 40);
  }

  void clearCache() {
    _jsonCache.clear();
    _sessionsManifestFuture = null;
  }

  Future<T> _fetchJson<T>(
    String url,
    T Function(dynamic json) parse,
  ) async {
    final res = await _dio.get<dynamic>(url);
    if (res.statusCode != 200) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'HTTP ${res.statusCode}: $url',
      );
    }
    return parse(_decodeResponseData(res.data));
  }

  /// GitHub Raw는 `content-type: text/plain`이라 Dio가 String으로 반환할 수 있음.
  dynamic _decodeResponseData(dynamic data) {
    if (data is String) {
      return jsonDecode(data);
    }
    return data;
  }

  List<ExamQuestion> _shuffleTake(List<ExamQuestion> questions, int n) {
    final copy = [...questions];
    final rng = Random();
    for (var i = copy.length - 1; i > 0; i--) {
      final j = rng.nextInt(i + 1);
      final tmp = copy[i];
      copy[i] = copy[j];
      copy[j] = tmp;
    }
    final take = n < copy.length ? n : copy.length;
    return copy.sublist(0, take);
  }
}
