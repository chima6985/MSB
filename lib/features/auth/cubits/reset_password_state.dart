part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = _Loading;
  const factory ResetPasswordState.loaded() = _Loaded;
  const factory ResetPasswordState.error({
    String? error,
  }) = _Error;
}
