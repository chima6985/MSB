// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_age_range_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyAgeRangeImpl _$$SurveyAgeRangeImplFromJson(Map<String, dynamic> json) =>
    _$SurveyAgeRangeImpl(
      id: json['id'] as String? ?? '',
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SurveyAgeRangeImplToJson(
        _$SurveyAgeRangeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'value': instance.value,
      'order': instance.order,
    };
