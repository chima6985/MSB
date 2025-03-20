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
  String _signUpEndpoint() => '$_baseUrl/user/auth/signup';

  /// Complete onboarding endpoint
  String _completeOnboardingEndpoint() =>
      '$_baseUrl/user/auth/complete-onboarding';

  /// Login endpoint
  String _loginEndpoint() => '$_baseUrl/user/auth/login';

  /// Validate email endpoint
  String _verifyOtpEndpoint() => '$_baseUrl/user/auth/verify-otp';

  /// Resend Otp endpoint
  String _resendOtpEndpoint() => '$_baseUrl/user/auth/resend-otp';

  /// Logout endpoint
  String _logoutEndpoint() => '$_baseUrl/auth/verify-email';

  // #missce

  /// Forget password endpoint
  String _forgetPasswordEndpoint() => '$_baseUrl/user/auth/forget-password';

  /// Verify Forget password otp endpoint
  String _verifyForgetPasswordOtpEndpoint() =>
      '$_baseUrl/auth/verify-forgot-password-otp';

  /// Reset password endpoint
  String _resetPasswordEndpoint() => '$_baseUrl/user/auth/reset-password';

  /// Get survey age range endpoint
  String _getSurveyAgeRange() => '$_baseUrl/user/auth/age-ranges';

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
        'email': email.toLowerCase(),
        'password': password,
        'reenter_password': password,
      };
      return await APIHelper.request<User>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          return const User();
        },
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  /// Complete Onboarding
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<void> completeOnboarding({
    required String email,
    required String otp,
    required String otpIdentifier,
  }) async {
    try {
      final url = _completeOnboardingEndpoint();
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

  /// Login a user
  ///
  /// Returns [User] on success.
  /// Throws [AuthException] when operation fails.
  Future<User> login({
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
        'email': email.toLowerCase(),
        'password': password,
      };
      return await APIHelper.request<User>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        ),
        onSuccessMap: (value) {
          // final user = value['user'] as Map<String, dynamic>;
          // user['token'] = value['token'];
          return User();
        },
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
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final url = _verifyOtpEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {
        'email': email,
        'otp': otp,
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

  /// Resend Otp
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<void> resendOtp({
    required String email,
  }) async {
    try {
      final url = _resendOtpEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {
        'email': email,
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

  /// Logout
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<void> logout({
    required String email,
    required String otp,
    required String otpIdentifier,
  }) async {
    try {
      final url = _logoutEndpoint();
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

  /// Forget password
  ///
  /// Returns void on success.
  /// Throws [AuthException] when operation fails.
  Future<void> forgetPassword({
    required String email,
  }) async {
    try {
      final url = _forgetPasswordEndpoint();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = {'email': email};
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
        'reenter_password': password,
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

  /// Get survey age range
  ///
  /// Returns [SurveyAgeRange] on success.
  /// Throws [AuthException] when operation fails.
  Future<List<SurveyAgeRange>> getSurveyAgeRange() async {
    try {
      final url = _getSurveyAgeRange();
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      return await APIHelper.request<List<SurveyAgeRange>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessList: (value) {
          return List<SurveyAgeRange>.from(value.map(SurveyAgeRange.fromJson));
        },
      );
    } on APIException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }
}
