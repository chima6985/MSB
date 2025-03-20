import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_age_range_model.freezed.dart';
part 'survey_age_range_model.g.dart';

@freezed
class SurveyAgeRange with _$SurveyAgeRange {
  const factory SurveyAgeRange({
    @Default('') String id,
    @Default('') String label,
    @Default('') String value,
    @Default(0) int order,
  }) = _SurveyAgeRange;

  factory SurveyAgeRange.fromJson(Map<String, dynamic> json) =>
      _$SurveyAgeRangeFromJson(json);
}
