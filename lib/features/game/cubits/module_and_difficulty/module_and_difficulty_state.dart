part of 'module_and_difficulty_cubit.dart';

@freezed
class ModuleAndDifficultyState with _$ModuleAndDifficultyState {
  const factory ModuleAndDifficultyState.initial() = _Initial;
  const factory ModuleAndDifficultyState.loading() = _Loading;
  const factory ModuleAndDifficultyState.loaded({
    required SectionDifficulty moduleDifficulty,
  }) = _Loaded;
  const factory ModuleAndDifficultyState.error({
    String? error,
  }) = _Error;
}
