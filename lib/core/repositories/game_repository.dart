import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masoyinbo_mobile/core/core.dart';

/// {@template user_repository_exception}
/// General exception for [GameRepository] methods.
/// {@endtemplate}
class GameException implements Exception {
  /// {@macro user_repository_exception}
  const GameException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template user_repository}
/// User repository interacts with the user API.
/// {@endtemplate}
class GameRepository {
  /// {@macro user_repository}
  GameRepository({
    required String baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _client = client ?? http.Client();

  final http.Client _client;
  final String _baseUrl;

  /// Get sections and difficulty endpoint
  String _getSectionsAndDifficulty(String languageId) =>
      '$_baseUrl/game/single-player/get-all-sections-and-difficulty';

  /// Get questions endpoint
  String _getQuestions(String difficulty, String section) =>
      '$_baseUrl/game/single-player/get-question/$difficulty/$section';

  /// Submit answer endpoint
  String _submitAnswerEndpoint() =>
      '$_baseUrl/game/single-player/submit-answer';

  /// Back to home endpoint
  String _backToHomeEndpoint() => '$_baseUrl/game/single-player/back-to-home';

  /// Get player rewards endpoint
  String _getPlayerRewards() => '$_baseUrl/game/single-player/rewards';

  /// Join room endpoint
  String _joinGameRoomEndpoint(String gameCode) =>
      '$_baseUrl/game/multi-player/$gameCode/join-room';

  /// Get sections and difficulty
  ///
  /// Returns void on success.
  /// Throws [GameException] when operation fails.
  Future<SectionDifficulty> getSectionsAndDifficulty({
    required String languageId,
    required String token,
  }) async {
    try {
      final url = _getSectionsAndDifficulty(languageId);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<SectionDifficulty>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: SectionDifficulty.fromJson,
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Get questions
  ///
  /// Returns [List<Question>] on success.
  /// Throws [GameException] when operation fails.
  Future<Map<String, dynamic>> getQuestions({
    required String difficulty,
    required String section,
    required String token,
  }) async {
    try {
      final url = _getQuestions(difficulty, section);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<Map<String, dynamic>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) => value,
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Submit answer
  ///
  /// Returns [AnswerResponse] on success.
  /// Throws [GameException] when operation fails.
  Future<AnswerResponse> submitAnswer({
    required String questionId,
    required String answer,
    required int startTime,
    required String token,
  }) async {
    try {
      final url = _submitAnswerEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'question_Id': questionId,
        'answer': answer,
        'start_time': startTime,
      };
      return await APIHelper.request<AnswerResponse>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: AnswerResponse.fromJson,
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Back to home
  ///
  /// Returns [void] on success.
  /// Throws [GameException] when operation fails.
  Future<void> backToHome({
    required String token,
  }) async {
    try {
      final url = _backToHomeEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<void>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Get player rewards
  ///
  /// Returns void on success.
  /// Throws [GameException] when operation fails.
  Future<void> getPlayerRewards({
    required String token,
  }) async {
    try {
      final url = _getPlayerRewards();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<void>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Join game room
  ///
  /// Returns [void] on success.
  /// Throws [GameException] when operation fails.
  Future<void> joinGameRoom({
    required String gameCode,
    required String token,
  }) async {
    try {
      final url = _joinGameRoomEndpoint(gameCode);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<void>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }
}
