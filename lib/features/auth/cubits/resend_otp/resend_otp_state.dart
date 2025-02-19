part of 'resend_otp_cubit.dart';

@freezed
class ResendOtpState with _$ResendOtpState {
  const factory ResendOtpState.initial() = _Initial;
  const factory ResendOtpState.loading() = _Loading;
  const factory ResendOtpState.loaded() = _Loaded;
  const factory ResendOtpState.error({
    String? error,
  }) = _Error;
}
