part of 'modify_game_room_cubit.dart';

@freezed
class ModifyGameRoomState with _$ModifyGameRoomState {
  const factory ModifyGameRoomState.initial() = _Initial;
  const factory ModifyGameRoomState.loading() = _Loading;
  const factory ModifyGameRoomState.loaded({
    required ModifiedGame modifiedGame,
  }) = _Loaded;
  const factory ModifyGameRoomState.error({
    String? error,
  }) = _Error;
}
