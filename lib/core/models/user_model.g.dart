// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      token: json['token'] as String? ?? '',
      updatedAt: ModelHelper.strToLocalDateTime(json['updated_at'] as String?),
      createdAt: ModelHelper.strToLocalDateTime(json['created_at'] as String?),
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      username: json['username'] as String? ?? '',
      usernameSlug: json['username_slug'] as String? ?? '',
      blockradarAddress: json['blockradar_address'] as String? ?? '',
      profilePhoto: json['profile_photo'] as String? ?? '',
      isDeleted: json['is_deleted'] as bool? ?? false,
      resetTokenExpiry:
          ModelHelper.strToLocalDateTime(json['reset_token_expiry'] as String?),
      authProvider: json['auth_provider'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'token': instance.token,
      'updated_at': ModelHelper.localDateTimeToUtcIsoStr(instance.updatedAt),
      'created_at': ModelHelper.localDateTimeToUtcIsoStr(instance.createdAt),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'username_slug': instance.usernameSlug,
      'blockradar_address': instance.blockradarAddress,
      'profile_photo': instance.profilePhoto,
      'is_deleted': instance.isDeleted,
      'reset_token_expiry':
          ModelHelper.localDateTimeToUtcIsoStr(instance.resetTokenExpiry),
      'auth_provider': instance.authProvider,
    };
