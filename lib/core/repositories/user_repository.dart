import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:mime/mime.dart';

/// {@template user_repository_exception}
/// General exception for [UserRepository] methods.
/// {@endtemplate}
class UserException implements Exception {
  /// {@macro user_repository_exception}
  const UserException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template user_repository}
/// User repository interacts with the user API.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({
    required String baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _client = client ?? http.Client();

  final http.Client _client;
  final String _baseUrl;

  /// Complete onboarding endpoint
  String _completeOnboardingEndpoint() =>
      '$_baseUrl/user/auth/complete-onboarding';

  /// Complete onboarding endpoint
  String _answerUserSurveyEndpoint() => '$_baseUrl/user/auth/user-survey';

  /// Get user endpoint
  String _getUserEndpoint() => '$_baseUrl/game/get-user';

  /// Update password endpoint
  String _updatePasswordEndpoint() => '$_baseUrl/user/update-password';

  /// Update user endpoint
  String _updateUserEndpoint() => '$_baseUrl/user/auth/update';

  /// Upload file endpoint
  String _uploadFileEndpoint() => '$_baseUrl/user/auth/upload';

  /// Complete onboarding
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<void> completeOnboarding({
    required String email,
    required String username,
    required String gender,
  }) async {
    try {
      final url = _completeOnboardingEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final body = {
        'email': email,
        'username': username,
        'gender': gender,
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
      throw UserException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }

  /// Answer user survey
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<void> answerUserSurvey({
    required String email,
    required List<String> surveyReason,
    required List<String> surveyUsage,
    required String surveyCommitment,
    required String surveyAge,
  }) async {
    try {
      final url = _answerUserSurveyEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final body = {
        'email': email,
        'survey_reason': surveyReason,
        'survey_usage': surveyUsage,
        'survey_commitment': surveyCommitment,
        'survey_age': surveyAge,
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
      throw UserException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }

  /// Get user
  ///
  /// Returns [User] on success.
  /// Throws [UserException] when operation fails.
  Future<User> getUser({
    required String token,
  }) async {
    try {
      final url = _getUserEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return await APIHelper.request<User>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) {
          final user = value;
          user['access_token'] = token;
          return User.fromJson(user);
        },
      );
    } on APIException catch (e) {
      throw UserException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }

  /// Update password
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<void> updatePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final url = _updatePasswordEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'current_password': currentPassword,
        'new_password': newPassword,
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
      throw UserException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }

  /// Update user image
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<void> updateUser({
    required String username,
    required String gender,
    required String token,
  }) async {
    try {
      final url = _updateUserEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'username': username,
        'gender': gender,
      };
      return await APIHelper.request<void>(
        request: _client.patch(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw UserException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }

  /// Update user image
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<void> updateUserImage({
    required String image,
    required String token,
  }) async {
    try {
      final url = _updateUserEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {'image': image};
      return await APIHelper.request<void>(
        request: _client.patch(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {},
      );
    } on APIException catch (e) {
      throw UserException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }

  /// Upload file
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<String?> uploadFile({
    required String filePath,
    required String token,
  }) async {
    try {
      final url = _uploadFileEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      };
      final fileProviderPath =
          await Functions.getImageFileFromAssets(filePath, 'avatar.jpg');
      final contentType = lookupMimeType(fileProviderPath);

      final file = await http.MultipartFile.fromPath(
        'image',
        fileProviderPath,
        contentType: MediaType(
          contentType?.split('/').first ?? 'image',
          contentType?.split('/').last ?? 'png',
        ),
      );
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.files.add(file);
      return await APIHelper.request<String?>(
        request: http.Response.fromStream(await request.send()),
        onSuccessMap: (value) {
          if (value.containsKey('files')) {
            final file = value['files'] as List;
            if (file.isNotEmpty) {
              // ignore: avoid_dynamic_calls
              return file.first['url'];
            } else {
              return null;
            }
          }
          return null;
        },
      );
    } on APIException catch (e) {
      throw UserException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const UserException();
    }
  }
}
