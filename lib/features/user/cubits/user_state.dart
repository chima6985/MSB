part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial({
    User? user,
  }) = _Initial;
  const factory UserState.loading({
    User? user,
  }) = _Loading;
  const factory UserState.loaded({
    required User user,
  }) = _Loaded;
  const factory UserState.error({
    @Default(null) User? user,
    String? error,
  }) = _Error;
}
