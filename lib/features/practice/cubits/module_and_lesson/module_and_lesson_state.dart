part of 'module_and_lesson_cubit.dart';

@freezed
class ModuleAndLessonState with _$ModuleAndLessonState {
  const factory ModuleAndLessonState.initial() = _Initial;
  const factory ModuleAndLessonState.loading() = _Loading;
  const factory ModuleAndLessonState.loaded() = _Loaded;
  const factory ModuleAndLessonState.error({
    String? error,
  }) = _Error;
}
