import 'package:http/http.dart' as http;
import 'package:masoyinbo_mobile/core/core.dart';

/// {@template learn_repository_exception}
/// General exception for [LearnRepository] methods.
/// {@endtemplate}
class LearnException implements Exception {
  /// {@macro learn_repository_exception}
  const LearnException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template learn_repository}
/// learn repository interacts with the learn API.
/// {@endtemplate}
class LearnRepository {
  /// {@macro learn_repository}
  LearnRepository({
    required String baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _client = client ?? http.Client();

  final http.Client _client;
  final String _baseUrl;

  /// Get module difficulty endpoint
  String _getModuleDifficultyEndpoint() => '$_baseUrl/learn/module-difficulty';

  /// Get all modules endpoint
  String _getAllModulesEndpoint(String difficultyId) =>
      '$_baseUrl/learn/all-modules/$difficultyId';

  /// Get lesson endpoint
  String _getLessonEndpoint(String moduleId) =>
      '$_baseUrl/learn/lesson/$moduleId';

  /// Get Module Difficulties
  ///
  /// Returns [List<ModuleDifficulty>] on success.
  /// Throws [LearnException] when operation fails.
  Future<List<ModuleDifficulty>> getModuleDifficulties({
    required String token,
  }) async {
    try {
      final url = _getModuleDifficultyEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<List<ModuleDifficulty>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessList: (value) {
          return (value as List)
              .map((item) => ModuleDifficulty.fromJson(item))
              .toList();
        },
      );
    } on APIException catch (e) {
      throw LearnException(message: e.message);
    } catch (e) {
      throw const LearnException();
    }
  }

  /// Get Module
  ///
  /// Returns [List<Module>] on success.
  /// Throws [LearnException] when operation fails.
  Future<List<Module>> getAllModules({
    required String difficultyId,
    required String token,
  }) async {
    try {
      final url = _getAllModulesEndpoint(difficultyId);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<List<Module>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {
          final modules = value['modules'] as List;
          return modules.map((item) => Module.fromJson(item)).toList();
        },
      );
    } on APIException catch (e) {
      throw LearnException(message: e.message);
    } catch (e) {
      throw const LearnException();
    }
  }

  /// Get Lesson
  ///
  /// Returns [dynamic] on success.
  /// Throws [LearnException] when operation fails.
  Future<dynamic> getLesson({
    required String moduleId,
    required String token,
  }) async {
    try {
      final url = _getLessonEndpoint(moduleId);
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
        onSuccessMap: (value) {
          return [];
        },
      );
    } on APIException catch (e) {
      throw LearnException(message: e.message);
    } catch (e) {
      throw const LearnException();
    }
  }
}
