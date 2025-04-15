part of 'join_game_room_cubit.dart';

@freezed
class JoinGameRoomState with _$JoinGameRoomState {
  const factory JoinGameRoomState.initial() = _Initial;
  const factory JoinGameRoomState.loading() = _Loading;
  const factory JoinGameRoomState.loaded() = _Loaded;
  const factory JoinGameRoomState.error({
    String? error,
  }) = _Error;
}
