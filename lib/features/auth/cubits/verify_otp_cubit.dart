import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'verify_otp_cubit.freezed.dart';
part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const VerifyOtpState.initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Verify otp
  Future<void> verifyOtp({
    required String email,
    required String code,
    required String otpIdentifier,
  }) async {
    try {
      emit(const _Verifying());
      final token = await _authRepository.verifyForgetPassword(
        email: email,
        code: code,
        otpIdentifier: otpIdentifier,
      );
      emit(_Verified(token: token));
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
