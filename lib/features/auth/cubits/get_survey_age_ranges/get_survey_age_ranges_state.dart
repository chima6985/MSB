part of 'get_survey_age_ranges_cubit.dart';

@freezed
class GetSurveyAgeRangesState with _$GetSurveyAgeRangesState {
  const factory GetSurveyAgeRangesState.initial() = _Initial;
  const factory GetSurveyAgeRangesState.loading() = _Loading;
  const factory GetSurveyAgeRangesState.loaded({
    required List<SurveyAgeRange> surveyAgeRanges,
  }) = _Loaded;
  const factory GetSurveyAgeRangesState.error({
    String? error,
  }) = _Error;
}
