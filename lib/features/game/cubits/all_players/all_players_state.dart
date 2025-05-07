part of 'all_players_cubit.dart';

@freezed
class AllPlayersState with _$AllPlayersState {
  const factory AllPlayersState.initial({
    @Default(<Player>[]) List<Player> players,
  }) = _Initial;
  const factory AllPlayersState.loading({
    List<Player>? players,
  }) = _Loading;
  const factory AllPlayersState.loaded({
    required List<Player> players,
  }) = _Loaded;
  const factory AllPlayersState.error({
    List<Player>? players,
    String? error,
  }) = _Error;
}
