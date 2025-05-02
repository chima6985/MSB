part of 'all_players_cubit.dart';

@freezed
class AllPlayersState with _$AllPlayersState {
  const factory AllPlayersState.initial() = _Initial;
  const factory AllPlayersState.loading() = _Loading;
  const factory AllPlayersState.loaded() = _Loaded;
  const factory AllPlayersState.error({
    String? error,
  }) = _Error;
}
