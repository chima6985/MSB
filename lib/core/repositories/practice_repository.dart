import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masoyinbo_mobile/core/core.dart';

/// {@template user_repository_exception}
/// General exception for [PracticeRepository] methods.
/// {@endtemplate}
class PracticeException implements Exception {
  /// {@macro user_repository_exception}
  const PracticeException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template user_repository}
/// User repository interacts with the user API.
/// {@endtemplate}
class PracticeRepository {
  /// {@macro user_repository}
  PracticeRepository({
    required String baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _client = client ?? http.Client();

  final http.Client _client;
  final String _baseUrl;

  /// Get module and lesson endpoint
  String _getModuleAndLessonEndponit(String language) =>
      '$_baseUrl/practice/module-and-lesson/$language';

  /// Get module questions endpoint
  String _getQuestionsEndponit(String difficulty, String section) =>
      '$_baseUrl/practice/get-question/$difficulty/$section';

  /// Submit answer endpoint
  String _submitAnswer() => '$_baseUrl/practice/submit-answer';

  /// Get Module and Lesson
  ///
  /// Returns [dynamic] on success.
  /// Throws [PracticeException] when operation fails.
  Future<dynamic> getModuleAndLessons({
    required String language,
    required String token,
  }) async {
    try {
      final url = _getModuleAndLessonEndponit(language);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<dynamic>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw PracticeException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const PracticeException();
    }
  }

  /// Get Module and Lesson
  ///
  /// Returns [dynamic] on success.
  /// Throws [PracticeException] when operation fails.
  Future<dynamic> getQuestions({
    required String difficulty,
    required String section,
    required String token,
  }) async {
    try {
      final url = _getQuestionsEndponit(difficulty, section);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<dynamic>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw PracticeException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const PracticeException();
    }
  }

  /// Submit answer
  ///
  /// Returns void on success.
  /// Throws [PracticeException] when operation fails.
  Future<void> submitAnswer({
    required String questionId,
    required String answer,
    required String token,
  }) async {
    try {
      final url = _submitAnswer();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'question_Id': questionId,
        'answer': answer,
      };
      return await APIHelper.request<void>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw PracticeException(message: e.message);
    } catch (e) {
      throw const PracticeException();
    }
  }
}
