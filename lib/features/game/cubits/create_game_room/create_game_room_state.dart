part of 'create_game_room_cubit.dart';

@freezed
class CreateGameRoomState with _$CreateGameRoomState {
  const factory CreateGameRoomState.initial() = _Initial;
  const factory CreateGameRoomState.loading() = _Loading;
  const factory CreateGameRoomState.loaded({
    required String gameCode,
  }) = _Loaded;
  const factory CreateGameRoomState.error({
    String? error,
  }) = _Error;
}
