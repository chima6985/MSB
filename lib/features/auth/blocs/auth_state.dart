part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated({
    User? user,
    String? error,
  }) = _AuthUnauthenticated;
  const factory AuthState.authenticating({
    User? user,
  }) = _AuthAuthenticating;
  const factory AuthState.authenticated({
    required User user,
  }) = _AuthAuthenticated;
  const factory AuthState.loginError({
    User? user,
    String? error,
  }) = _LoginError;
  const factory AuthState.signUpError({
    User? user,
    String? error,
  }) = _SignUpError;
  const factory AuthState.authSignedOut({
    User? user,
    String? message,
  }) = _AuthSignedOut;
}
