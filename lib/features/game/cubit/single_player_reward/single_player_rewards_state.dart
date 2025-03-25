part of 'single_player_rewards_cubit.dart';

@freezed
class SinglePlayerRewardsState with _$SinglePlayerRewardsState {
  const factory SinglePlayerRewardsState.initial() = _Initial;
  const factory SinglePlayerRewardsState.loading() = _Loading;
  const factory SinglePlayerRewardsState.loaded() = _Loaded;
  const factory SinglePlayerRewardsState.error({
    String? error,
  }) = _Error;
}
