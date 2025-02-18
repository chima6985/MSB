import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    @Default('') String token,
    @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'updated_at',
    )
    DateTime? updatedAt,
    @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'created_at',
    )
    DateTime? createdAt,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String username,
    @JsonKey(name: 'username_slug') @Default('') String usernameSlug,
    @JsonKey(name: 'blockradar_address') @Default('') String blockradarAddress,
    @JsonKey(name: 'profile_photo') @Default('') String profilePhoto,
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
    @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'reset_token_expiry',
    )
    DateTime? resetTokenExpiry,
    @JsonKey(name: 'auth_provider') @Default('') String authProvider,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
