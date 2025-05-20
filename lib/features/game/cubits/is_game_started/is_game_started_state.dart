part of 'is_game_started_cubit.dart';

@freezed
class IsGameStartedState with _$IsGameStartedState {
  const factory IsGameStartedState.initial() = _Initial;
  const factory IsGameStartedState.loading() = _Loading;
  const factory IsGameStartedState.loaded({
    required bool isGameStarted,
  }) = _Loaded;
  const factory IsGameStartedState.error({
    String? error,
  }) = _Error;
}
