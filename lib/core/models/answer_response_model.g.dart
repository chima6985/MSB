// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerResponseImpl _$$AnswerResponseImplFromJson(Map<String, dynamic> json) =>
    _$AnswerResponseImpl(
      message: json['message'] as String? ?? '',
      accuracy: (json['accuracy'] as num?)?.toInt() ?? 0,
      coinsEarned: (json['coins_earned'] as num?)?.toInt() ?? 0,
      totalLives: (json['total_lives'] as num?)?.toInt() ?? 0,
      timeSpent: json['timeSpent'] as String? ?? '',
    );

Map<String, dynamic> _$$AnswerResponseImplToJson(
        _$AnswerResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'accuracy': instance.accuracy,
      'coins_earned': instance.coinsEarned,
      'total_lives': instance.totalLives,
      'timeSpent': instance.timeSpent,
    };
