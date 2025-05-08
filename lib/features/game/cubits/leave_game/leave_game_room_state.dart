part of 'leave_game_room_cubit.dart';

@freezed
class LeaveGameRoomState with _$LeaveGameRoomState {
  const factory LeaveGameRoomState.initial() = _Initial;
  const factory LeaveGameRoomState.loading() = _Loading;
  const factory LeaveGameRoomState.loaded() = _Loaded;
  const factory LeaveGameRoomState.error({
    String? error,
  }) = _Error;
}
