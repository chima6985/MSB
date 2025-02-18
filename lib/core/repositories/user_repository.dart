import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masoyinbo_mobile/core/core.dart';

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
  String _completeOnboardingEndpoint() => '$_baseUrl/user/complete-onboarding';

  /// Get user endpoint
  String _getUserEndpoint() => '$_baseUrl/user/profile';

  /// Update password endpoint
  String _updatePasswordEndpoint() => '$_baseUrl/user/update-password';

  /// Complete onboarding
  ///
  /// Returns void on success.
  /// Throws [UserException] when operation fails.
  Future<void> completeOnboarding({
    required String token,
    String? firstName,
    String? middleName,
    String? lastName,
    String? dob,
    String? address,
    String? city,
    String? postalCode,
    String? country,
    String? verificationDocumentType,
    String? verificationDocument,
  }) async {
    try {
      final url = _completeOnboardingEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = <String, String>{
        if (firstName?.isNotEmpty ?? false) 'first_name': firstName!,
        if (middleName?.isNotEmpty ?? false) 'middle_name': middleName!,
        if (lastName?.isNotEmpty ?? false) 'last_name': lastName!,
        if (dob?.isNotEmpty ?? false) 'dob': dob!,
        if (address?.isNotEmpty ?? false) 'address': address!,
        if (city?.isNotEmpty ?? false) 'city': city!,
        if (postalCode?.isNotEmpty ?? false) 'postal_code': postalCode!,
        if (country?.isNotEmpty ?? false) 'country': country!,
        if (verificationDocumentType?.isNotEmpty ?? false)
          'verification_document_type': verificationDocumentType!,
      };
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields.addAll(body);
      if (verificationDocumentType?.isNotEmpty ?? false) {
        final uploads = <http.MultipartFile>[
          await http.MultipartFile.fromPath(
            'verification_document',
            verificationDocument!,
            filename: verificationDocument,
          ),
        ];
        request.files.addAll(uploads);
      }
      return await APIHelper.request<void>(
        request: http.Response.fromStream(await request.send()),
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
          final user = value['user'] as Map<String, dynamic>;
          user['token'] = token;
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
}
