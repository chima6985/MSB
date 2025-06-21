part of 'all_modules_cubit.dart';

@freezed
class AllModulesState with _$AllModulesState {
  const factory AllModulesState.initial() = _Initial;
  const factory AllModulesState.loading() = _Loading;
  const factory AllModulesState.loaded({
    required List<Module> modules,
  }) = _Loaded;
  const factory AllModulesState.error({
    String? error,
  }) = _Error;
}
