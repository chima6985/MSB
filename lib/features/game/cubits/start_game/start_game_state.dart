part of 'start_game_cubit.dart';

@freezed
class StartGameState with _$StartGameState {
  const factory StartGameState.initial() = _Initial;
  const factory StartGameState.loading() = _Loading;
  const factory StartGameState.loaded() = _Loaded;
  const factory StartGameState.error({
    String? error,
  }) = _Error;
}
