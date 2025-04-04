import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'resend_otp_state.dart';
part 'resend_otp_cubit.freezed.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const ResendOtpState.initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Resend otp
  Future<void> resendOtp({
    required String email,
  }) async {
    try {
      emit(const _Loading());
      await _authRepository.resendOtp(
        email: email,
      );
      emit(const _Loaded());
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
