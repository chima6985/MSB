import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'social_auth_state.dart';
part 'social_auth_cubit.freezed.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  SocialAuthCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const SocialAuthState.initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Apple sign in
  Future<void> appleSignIn({
    required String token,
  }) async {
    try {
      emit(const _Verifying());
      // final user = await _authRepository.appleSignIn(
      //   token: token,
      // );
      // AppStorage.saveUser(user);
      // emit(_Verified(user: user));
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }

  /// Initiate google sign in
  Future<void> initiateGoogleSignIn() async {
    try {
      emit(const _Initiating());
      // final url = await _authRepository.googleSignIn();
      // emit(_Initiated(url: url));
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }

  /// Verify google sign in
  Future<void> verifyGoogleSignIn({
    required String code,
  }) async {
    try {
      emit(const _Verifying());
      // final user = await _authRepository.googleSignInCallback(
      //   code: code,
      // );
      // AppStorage.saveUser(user);
      // emit(_Verified(user: user));
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
