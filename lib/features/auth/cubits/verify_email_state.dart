part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = _Initial;
  const factory VerifyEmailState.verifying() = _Verifying;
  const factory VerifyEmailState.verified() = _Verified;
  const factory VerifyEmailState.error({
    String? error,
  }) = _Error;
}
