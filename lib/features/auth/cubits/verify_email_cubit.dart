import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'verify_email_state.dart';
part 'verify_email_cubit.freezed.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const VerifyEmailState.initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Validate email
  Future<void> verifyEmail({
    required String email,
    required String otp,
    required String otpIdentifier,
  }) async {
    try {
      emit(const _Verifying());
      await _authRepository.verifyEmail(
        email: email,
        otp: otp,
        otpIdentifier: otpIdentifier,
      );
      emit(const _Verified());
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
