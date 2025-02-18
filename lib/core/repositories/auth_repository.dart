import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:masoyinbo_mobile/core/core.dart';

/// {@template auth_repository_exception}
/// General exception for [AuthRepository] methods.
/// {@endtemplate}
class AuthException implements Exception {
  /// {@macro auth_repository_exception}
  const AuthException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template auth_repository}
/// Auth repository interacts with the auth API.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository({
    required String baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _client = client ?? http.Client();

  final http.Client _client;
  final String _baseUrl;

  /// Sign up endpoint
  String _signUpEndpoint() => '$_baseUrl/auth/signup';

  /// Login endpoint
  String _loginEndpoint() => '$_baseUrl/auth/signIn';

  /// Validate email endpoint
  String _validateEmailEndpoint() => '$_baseUrl/auth/validate-email';

  /// Verify email endpoint
  String _verifyEmailEndpoint() => '$_baseUrl/auth/verify-email';

  /// Google sign in endpoint
  String _googleSignInEndpoint() => '$_baseUrl/auth/google';

  /// Google auth callback endpoint
  String _googleAuthCallbackEndpoint() => '$_baseUrl/auth/google/callback';

  /// Google sign in endpoint
  String _appleSignInEndpoint() => '$_baseUrl/auth/apple';

  /// Forget password endpoint
  String _forgetPasswordEndpoint() => '$_baseUrl/auth/forgot-password';

  /// Verify Forget password otp endpoint
  String _verifyForgetPasswordOtpEndpoint() =>
      '$_baseUrl/auth/verify-forgot-password-otp';

  /// Reset password endpoint
  String _resetPasswordEndpoint() => '$_baseUrl/auth/reset-password';

  /// Registers a new user
  ///
  /// Returns [User] on success.
  /// Throws [AuthException] when operation fails.
  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final url = _signUpEndpoint();
      final headers = {
        'Accept': 'application/json',
        'content-type': 'application/json',
      };
      final body = {
        'email': email.toLowerCase().trim(),
        'password': password,
      };
      return await APIHelper.request<User>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          final user = value['user'] as Map<String, dynamic>;
          user['token'] = value['token'];
          return User.fromJson(user);
        },
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (_) {
      throw const AuthException();
    }
  }

  /// Login a user
  ///
  /// Returns [User] on success.
  /// Throws [AuthException] when operation fails.
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final url = _loginEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {
        'email': email.toLowerCase().trim(),
        'password': password,
      };
      return await APIHelper.request<User>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          final user = value['user'] as Map<String, dynamic>;
          user['token'] = value['token'];
          return User.fromJson(user);
        },
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Validate email
  ///
  /// Returns otp identifier [String] on success.
  /// Throws [AuthException] when operation fails.
  Future<Map<String, dynamic>> validateEmail({
    required String email,
  }) async {
    try {
      final url = _validateEmailEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {'email': email.toLowerCase().trim()};
      return await APIHelper.request<Map<String, dynamic>>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) => value,
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Verify email
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<void> verifyEmail({
    required String email,
    required String otp,
    required String otpIdentifier,
  }) async {
    try {
      final url = _verifyEmailEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {
        'email': email.toLowerCase().trim(),
        'code': otp,
        'otp_identifier': otpIdentifier,
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
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Google sign in initiation
  ///
  /// Returns [String] on success.
  /// Throws [AuthException] when operation fails.
  Future<String> googleSignIn() async {
    try {
      final url = _googleSignInEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      return await APIHelper.request<String>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessMap: (value) => value['signin_url'],
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Apple sign in verification
  ///
  /// Returns [User] on success.
  /// Throws [AuthException] when operation fails.
  Future<User> googleSignInCallback({
    required String code,
  }) async {
    try {
      final url = _googleAuthCallbackEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {'code': code};
      return await APIHelper.request<User>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          final user = value['user'] as Map<String, dynamic>;
          user['token'] = value['token'];
          return User.fromJson(user);
        },
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Apple sign in verification
  ///
  /// Returns [User] on success.
  /// Throws [AuthException] when operation fails.
  Future<User> appleSignIn({
    required String token,
  }) async {
    try {
      final url = _appleSignInEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {'token': token};
      return await APIHelper.request<User>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          final user = value['user'] as Map<String, dynamic>;
          user['token'] = value['token'];
          return User.fromJson(user);
        },
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Forget password
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<Map<String, dynamic>> forgetPassword({
    required String email,
  }) async {
    try {
      final url = _forgetPasswordEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {'email': email.toLowerCase().trim()};
      return await APIHelper.request<Map<String, dynamic>>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) => value,
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Verify forget password
  ///
  /// Returns [String] on success.
  /// Throws [AuthException] when operation fails.
  Future<String> verifyForgetPassword({
    required String email,
    required String code,
    required String otpIdentifier,
  }) async {
    try {
      final url = _verifyForgetPasswordOtpEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {
        'email': email.toLowerCase().trim(),
        'code': code,
        'otp_identifier': otpIdentifier,
      };
      return await APIHelper.request<String>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) => value['reset_token'] as String,
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  /// Reset password
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<void> resetPassword({
    required String email,
    required String password,
    required String resetToken,
  }) async {
    try {
      final url = _resetPasswordEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {
        'email': email.toLowerCase().trim(),
        'password': password,
        'reset_token': resetToken,
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
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }
}
