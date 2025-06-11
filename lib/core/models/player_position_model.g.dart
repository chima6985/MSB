// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerPositionImpl _$$PlayerPositionImplFromJson(Map<String, dynamic> json) =>
    _$PlayerPositionImpl(
      userId: json['userId'] as String? ?? '',
      username: json['username'] as String? ?? '',
      points: (json['points'] as num?)?.toInt() ?? 0,
      position: (json['position'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PlayerPositionImplToJson(
        _$PlayerPositionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'points': instance.points,
      'position': instance.position,
    };
