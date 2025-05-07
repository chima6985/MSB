// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameDetailsImpl _$$GameDetailsImplFromJson(Map<String, dynamic> json) =>
    _$GameDetailsImpl(
      section: json['section'] as String? ?? '',
      difficulty: json['difficulty'] as String? ?? '',
      teamMode: json['team_mode'] as bool? ?? false,
    );

Map<String, dynamic> _$$GameDetailsImplToJson(_$GameDetailsImpl instance) =>
    <String, dynamic>{
      'section': instance.section,
      'difficulty': instance.difficulty,
      'team_mode': instance.teamMode,
    };
