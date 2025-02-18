part of 'verify_otp_cubit.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState.initial() = _Initial;
  const factory VerifyOtpState.verifying() = _Verifying;
  const factory VerifyOtpState.verified({
    required String token,
  }) = _Verified;
  const factory VerifyOtpState.error({
    String? error,
  }) = _Error;
}
