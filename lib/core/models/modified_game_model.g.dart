// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modified_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModifiedGameImpl _$$ModifiedGameImplFromJson(Map<String, dynamic> json) =>
    _$ModifiedGameImpl(
      teamMode: json['team_mode'] as bool? ?? false,
      teamFormation: json['team_formation'] as bool? ?? null,
    );

Map<String, dynamic> _$$ModifiedGameImplToJson(_$ModifiedGameImpl instance) =>
    <String, dynamic>{
      'team_mode': instance.teamMode,
      'team_formation': instance.teamFormation,
    };
