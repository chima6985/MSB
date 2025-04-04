import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const _Initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Forget password
  Future<void> forgetPassword({
    required String email,
  }) async {
    try {
      emit(const _Loading());
      await _authRepository.forgetPassword(
        email: email,
      );
      emit(const _Loaded());
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
