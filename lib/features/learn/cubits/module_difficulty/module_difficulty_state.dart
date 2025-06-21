part of 'module_difficulty_cubit.dart';

@freezed
class ModuleDifficultyState with _$ModuleDifficultyState {
  const factory ModuleDifficultyState.initial() = _Initial;
  const factory ModuleDifficultyState.loading() = _Loading;
  const factory ModuleDifficultyState.loaded({
    required List<ModuleDifficulty> moduleDifficulties,
  }) = _Loaded;
  const factory ModuleDifficultyState.error({
    String? error,
  }) = _Error;
}
