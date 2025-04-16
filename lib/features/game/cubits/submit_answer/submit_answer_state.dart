part of 'submit_answer_cubit.dart';

@freezed
class SubmitAnswerState with _$SubmitAnswerState {
  const factory SubmitAnswerState.initial() = _Initial;
  const factory SubmitAnswerState.loading() = _Loading;
  const factory SubmitAnswerState.loaded({
    required AnswerResponse answerResponse,
  }) = _Loaded;
  const factory SubmitAnswerState.error({
    String? error,
  }) = _Error;
}
