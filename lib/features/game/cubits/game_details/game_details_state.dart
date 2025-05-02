part of 'game_details_cubit.dart';

@freezed
class GameDetailsState with _$GameDetailsState {
  const factory GameDetailsState.initial() = _Initial;
  const factory GameDetailsState.loading() = _Loading;
  const factory GameDetailsState.loaded() = _Loaded;
  const factory GameDetailsState.error({
    String? error,
  }) = _Error;
}
