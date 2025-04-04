part of 'get_question_cubit.dart';

@freezed
class GetQuestionState with _$GetQuestionState {
  const factory GetQuestionState.initial() = _Initial;
  const factory GetQuestionState.loading() = _Loading;
  const factory GetQuestionState.loaded() = _Loaded;
  const factory GetQuestionState.error({
    String? error,
  }) = _Error;
}
