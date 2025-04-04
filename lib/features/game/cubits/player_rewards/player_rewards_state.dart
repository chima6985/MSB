part of 'player_rewards_cubit.dart';

@freezed
class PlayerRewardsState with _$PlayerRewardsState {
  const factory PlayerRewardsState.initial() = _Initial;
  const factory PlayerRewardsState.loading() = _Loading;
  const factory PlayerRewardsState.loaded() = _Loaded;
  const factory PlayerRewardsState.error({
    String? error,
  }) = _Error;
}
