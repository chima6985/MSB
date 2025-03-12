part of 'forget_password_cubit.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = _Loading;
  const factory ForgetPasswordState.loaded() = _Loaded;
  const factory ForgetPasswordState.error({
    String? error,
  }) = _Error;
}
