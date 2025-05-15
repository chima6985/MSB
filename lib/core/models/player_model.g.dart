// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      section: json['game_player_id'] as String? ?? '',
      difficulty: json['user_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      isGameMaster: json['is_game_master'] as bool? ?? false,
      isTeamLeader: json['is_team_leader'] as bool? ?? false,
      imageUrl: json['image_url'] as String? ?? '',
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'game_player_id': instance.section,
      'user_id': instance.difficulty,
      'username': instance.username,
      'is_game_master': instance.isGameMaster,
      'is_team_leader': instance.isTeamLeader,
      'image_url': instance.imageUrl,
    };
