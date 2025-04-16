part of 'reset_user_stats_cubit.dart';

@freezed
class ResetUserStatsState with _$ResetUserStatsState {
  const factory ResetUserStatsState.initial() = _Initial;
  const factory ResetUserStatsState.loading() = _Loading;
  const factory ResetUserStatsState.loaded() = _Loaded;
  const factory ResetUserStatsState.error({
    String? error,
  }) = _Error;
}
