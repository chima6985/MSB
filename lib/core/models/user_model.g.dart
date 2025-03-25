// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String? ?? '',
      token: json['token'] as String? ?? '',
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      isCompleted: json['is_completed'] as bool? ?? false,
      isSurveyCompleted: json['is_survey_completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'email': instance.email,
      'username': instance.username,
      'gender': instance.gender,
      'is_completed': instance.isCompleted,
      'is_survey_completed': instance.isSurveyCompleted,
    };
