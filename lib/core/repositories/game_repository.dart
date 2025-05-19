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

  /// Submit practice answer endpoint
  String _submitPracticeAnswerEndpoint() => '$_baseUrl/practice/submit-answer';

  /// Submit single player answer endpoint
  String _submitSinglePlayerAnswerEndpoint() =>
      '$_baseUrl/game/single-player/submit-answer';

  /// Back to home endpoint
  String _backToHomeEndpoint() => '$_baseUrl/game/single-player/back-to-home';

  /// Get user analytics endpoint
  String _getUserAnalyticsEndpoint() => '$_baseUrl/practice/get-user-analytics';

  /// Get player rewards endpoint
  String _getPlayerRewards() => '$_baseUrl/game/single-player/rewards';

  /// Join room endpoint
  String _joinGameRoomEndpoint(String gameCode) =>
      '$_baseUrl/game/multi-player/$gameCode/join-room';

  /// Get game details endpoint
  String _getGameDetailsEndpoint(String gameCode) =>
      '$_baseUrl/game/multi-player/invitee/get-game-details/$gameCode';

  /// Create room endpoint
  String _createRoomEndpoint() => '$_baseUrl/game/multi-player/create-room';

  /// Get all players endpoint
  String _getAllPlayersEndpoint(String gameCode) =>
      '$_baseUrl/game/multi-player/$gameCode/get-all-players';

  /// Leave game room endpoint
  String _leaveGameRoomEndpoint() => '$_baseUrl/game/multiplayer/leave-game';

  /// Leave game room endpoint
  String _modifyGameRoomEndpoint(String gameId) =>
      '$_baseUrl/game/multi-player/modify-game-room/$gameId';

  /// Start game endpoint
  String _startGameEndpoint(String gameCode) =>
      '$_baseUrl/game/multiplayer/$gameCode/start-game';

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
    required bool isPractice,
    required String token,
  }) async {
    try {
      final url = isPractice
          ? _submitPracticeAnswerEndpoint()
          : _submitSinglePlayerAnswerEndpoint();
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
  /// Returns [PlayerStat] on success.
  /// Throws [GameException] when operation fails.
  Future<PlayerStat> getPlayerRewards({
    required bool isPractice,
    required String token,
  }) async {
    try {
      final url =
          isPractice ? _getUserAnalyticsEndpoint() : _getPlayerRewards();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<PlayerStat>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: PlayerStat.fromJson,
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

  /// Get game details
  ///
  /// Returns [GameDetails] on success.
  /// Throws [GameException] when operation fails.
  Future<GameDetails> getGameDetails({
    required String gameCode,
    required String token,
  }) async {
    try {
      final url = _getGameDetailsEndpoint(gameCode);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<GameDetails>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: GameDetails.fromJson,
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Create room
  ///
  /// Returns [String] on success.
  /// Throws [GameException] when operation fails.
  Future<String> createRoom({
    required String sectionId,
    required String difficultyId,
    required bool teamMode,
    required String teamFormation,
    required String token,
  }) async {
    try {
      final url = _createRoomEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'section_id': sectionId,
        'difficulty_id': difficultyId,
        'team_mode': teamMode,
        if (teamMode) 'team_formation': teamFormation,
      };
      return await APIHelper.request<String>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          if (value.containsKey('gameCode')) {
            return value['gameCode'];
          } else {
            return '';
          }
        },
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Get all players
  ///
  /// Returns [void] on success.
  /// Throws [GameException] when operation fails.
  Future<List<Player>> getAllPlayers({
    required String gameCode,
    required String token,
  }) async {
    try {
      final url = _getAllPlayersEndpoint(gameCode);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<List<Player>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {
          final players = value['players'] as List;
          return players.map((item) => Player.fromJson(item)).toList();
        },
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Leave game room
  ///
  /// Returns [void] on success.
  /// Throws [GameException] when operation fails.
  Future<void> leaveGameRoom({
    required String token,
  }) async {
    try {
      final url = _leaveGameRoomEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<void>(
        request: _client.delete(
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

  /// Modify game room
  ///
  /// Returns [ModifiedGame] on success.
  /// Throws [GameException] when operation fails.
  Future<ModifiedGame> modifyGameRoom({
    required String gameCode,
    required bool teamMode,
    required String teamFormation,
    required String token,
  }) async {
    try {
      final url = _modifyGameRoomEndpoint(gameCode);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'teamMode': teamMode,
        if (teamMode) 'teamFormation': teamFormation,
      };
      return await APIHelper.request<ModifiedGame>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: ModifiedGame.fromJson,
      );
    } on APIException catch (e) {
      throw GameException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const GameException();
    }
  }

  /// Start game
  ///
  /// Returns [void] on success.
  /// Throws [GameException] when operation fails.
  Future<void> startGame({
    required String gameCode,
    required String token,
  }) async {
    try {
      final url = _startGameEndpoint(gameCode);
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
