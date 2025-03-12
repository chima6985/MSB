import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'reset_password_state.dart';
part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const ResetPasswordState.initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Reset password
  Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(const _Loading());
      await _authRepository.resetPassword(
        email: email,
        password: password,
      );
      emit(const _Loaded());
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
