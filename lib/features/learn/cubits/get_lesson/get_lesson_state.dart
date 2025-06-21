part of 'get_lesson_cubit.dart';

@freezed
class GetLessonState with _$GetLessonState {
  const factory GetLessonState.initial() = _Initial;
  const factory GetLessonState.loading() = _Loading;
  const factory GetLessonState.loaded({
    required dynamic lesson,
  }) = _Loaded;
  const factory GetLessonState.error({
    String? error,
  }) = _Error;
}
