part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authAppStarted() = _AuthAppStarted;
  const factory AuthEvent.authSignUp({
    required String email,
    required String password,
  }) = _AuthSignUp;
  const factory AuthEvent.authSignIn({
    required String email,
    required String password,
  }) = _AuthSignIn;
  const factory AuthEvent.authSignOut({
    String? message,
  }) = _AuthSignOut;
}
