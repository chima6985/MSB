part of 'user_survey_cubit.dart';

@freezed
class UserSurveyState with _$UserSurveyState {
  const factory UserSurveyState.initial() = _Initial;
  const factory UserSurveyState.loading() = _Loading;
  const factory UserSurveyState.loaded() = _Loaded;
  const factory UserSurveyState.error({
    String? error,
  }) = _Error;
}
