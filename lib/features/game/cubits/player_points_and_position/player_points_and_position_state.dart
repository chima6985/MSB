part of 'player_points_and_position_cubit.dart';

@freezed
class PlayerPointsAndPositionState with _$PlayerPointsAndPositionState {
  const factory PlayerPointsAndPositionState.initial({
    @Default(<PlayerPosition>[]) List<PlayerPosition> players,
  }) = _Initial;
  const factory PlayerPointsAndPositionState.loading({
    List<PlayerPosition>? players,
  }) = _Loading;
  const factory PlayerPointsAndPositionState.loaded({
    required List<PlayerPosition> players,
  }) = _Loaded;
  const factory PlayerPointsAndPositionState.error({
    List<PlayerPosition>? players,
    String? error,
  }) = _Error;
}
