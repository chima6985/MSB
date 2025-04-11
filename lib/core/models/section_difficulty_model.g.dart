// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_difficulty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionDifficultyImpl _$$SectionDifficultyImplFromJson(
        Map<String, dynamic> json) =>
    _$SectionDifficultyImpl(
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Section>[],
      difficulties: (json['difficulties'] as List<dynamic>?)
              ?.map((e) => Difficulty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Difficulty>[],
    );

Map<String, dynamic> _$$SectionDifficultyImplToJson(
        _$SectionDifficultyImpl instance) =>
    <String, dynamic>{
      'sections': instance.sections,
      'difficulties': instance.difficulties,
    };

_$SectionImpl _$$SectionImplFromJson(Map<String, dynamic> json) =>
    _$SectionImpl(
      id: json['id'] as String? ?? '',
      sectionName: json['section_name'] as String? ?? '',
      yorubaSectionName: json['yoruba_section_name'] as String? ?? '',
    );

Map<String, dynamic> _$$SectionImplToJson(_$SectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section_name': instance.sectionName,
      'yoruba_section_name': instance.yorubaSectionName,
    };

_$DifficultyImpl _$$DifficultyImplFromJson(Map<String, dynamic> json) =>
    _$DifficultyImpl(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$DifficultyImplToJson(_$DifficultyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
    };
