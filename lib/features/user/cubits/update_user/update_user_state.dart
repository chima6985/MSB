part of 'update_user_cubit.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = _Initial;
  const factory UpdateUserState.updating() = _Updating;
  const factory UpdateUserState.updated() = _Updated;
  const factory UpdateUserState.error({
    String? error,
  }) = _Error;
}
