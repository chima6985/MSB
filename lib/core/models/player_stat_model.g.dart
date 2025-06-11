// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStatImpl _$$PlayerStatImplFromJson(Map<String, dynamic> json) =>
    _$PlayerStatImpl(
      message: json['message'] as String? ?? '',
      accuracy: (json['accuracy'] as num?)?.toInt() ?? 0,
      coins: (json['coins'] as num?)?.toInt() ?? 0,
      timeSpent: json['timeSpent'] as String? ?? '',
      points: (json['points'] as num?)?.toInt() ?? 0,
      answeredCorrectly: json['answererd_correctly'] as String? ?? '',
    );

Map<String, dynamic> _$$PlayerStatImplToJson(_$PlayerStatImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'accuracy': instance.accuracy,
      'coins': instance.coins,
      'timeSpent': instance.timeSpent,
      'points': instance.points,
      'answererd_correctly': instance.answeredCorrectly,
    };
