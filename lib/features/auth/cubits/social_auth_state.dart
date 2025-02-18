part of 'social_auth_cubit.dart';

@freezed
class SocialAuthState with _$SocialAuthState {
  const factory SocialAuthState.initial() = _Initial;
  const factory SocialAuthState.initiating() = _Initiating;
  const factory SocialAuthState.initiated({
    required String url,
  }) = _Initiated;
  const factory SocialAuthState.verifying() = _Verifying;
  const factory SocialAuthState.verified({
    required User user,
  }) = _Verified;
  const factory SocialAuthState.error({
    String? error,
  }) = _Error;
}
