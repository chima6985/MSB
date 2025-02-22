import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const _AuthUnauthenticated()) {
    on<_AuthAppStarted>(_onAuthAppStarted);
    on<_AuthSignIn>(_onAuthSignIn);
    on<_AuthSignUp>(_onAuthSignUp);
    on<_AuthSignOut>(_onAuthSignOut);
  }

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Check if any user is in storage
  Future<void> _onAuthAppStarted(
    _AuthAppStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = AppStorage.getUser();
      emit(_AuthUnauthenticated(user: user));
      //await PushNotificationsManager().init();
    } on AuthException catch (e) {
      emit(_AuthUnauthenticated(error: e.message));
    }
  }

  /// Sign up
  Future<void> _onAuthSignUp(
    _AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const _AuthAuthenticating());
      final user = await _authRepository.signUp(
        email: event.email,
        password: event.password,
        reenterPassword: event.reenterPassword,
      );
      emit(_AuthAuthenticated(user: user));
    } on AuthException catch (e) {
      emit(_SignUpError(error: e.message));
    }
  }

  /// Sign in
  Future<void> _onAuthSignIn(
    _AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(_AuthAuthenticating(user: state.user));
      final user = await _authRepository.login(
        email: event.email,
        password: event.password,
      );
      AppStorage.saveUser(user);
      emit(_AuthAuthenticated(user: user));
    } on AuthException catch (e) {
      emit(_LoginError(error: e.message, user: state.user));
    }
  }

  Future<void> _onAuthSignOut(
    _AuthSignOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(const _AuthSignedOut());
    await AppStorage.clear();
  }
}
