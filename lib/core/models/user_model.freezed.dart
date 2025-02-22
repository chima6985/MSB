// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'username_slug')
  String get usernameSlug => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockradar_address')
  String get blockradarAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo')
  String get profilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'reset_token_expiry')
  DateTime? get resetTokenExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_provider')
  String get authProvider => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String token,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'updated_at')
      DateTime? updatedAt,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'created_at')
      DateTime? createdAt,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String phone,
      String username,
      @JsonKey(name: 'username_slug') String usernameSlug,
      @JsonKey(name: 'blockradar_address') String blockradarAddress,
      @JsonKey(name: 'profile_photo') String profilePhoto,
      @JsonKey(name: 'is_deleted') bool isDeleted,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'reset_token_expiry')
      DateTime? resetTokenExpiry,
      @JsonKey(name: 'auth_provider') String authProvider});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? token = null,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? username = null,
    Object? usernameSlug = null,
    Object? blockradarAddress = null,
    Object? profilePhoto = null,
    Object? isDeleted = null,
    Object? resetTokenExpiry = freezed,
    Object? authProvider = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usernameSlug: null == usernameSlug
          ? _value.usernameSlug
          : usernameSlug // ignore: cast_nullable_to_non_nullable
              as String,
      blockradarAddress: null == blockradarAddress
          ? _value.blockradarAddress
          : blockradarAddress // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      resetTokenExpiry: freezed == resetTokenExpiry
          ? _value.resetTokenExpiry
          : resetTokenExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authProvider: null == authProvider
          ? _value.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String token,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'updated_at')
      DateTime? updatedAt,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'created_at')
      DateTime? createdAt,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String phone,
      String username,
      @JsonKey(name: 'username_slug') String usernameSlug,
      @JsonKey(name: 'blockradar_address') String blockradarAddress,
      @JsonKey(name: 'profile_photo') String profilePhoto,
      @JsonKey(name: 'is_deleted') bool isDeleted,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'reset_token_expiry')
      DateTime? resetTokenExpiry,
      @JsonKey(name: 'auth_provider') String authProvider});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? token = null,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? username = null,
    Object? usernameSlug = null,
    Object? blockradarAddress = null,
    Object? profilePhoto = null,
    Object? isDeleted = null,
    Object? resetTokenExpiry = freezed,
    Object? authProvider = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usernameSlug: null == usernameSlug
          ? _value.usernameSlug
          : usernameSlug // ignore: cast_nullable_to_non_nullable
              as String,
      blockradarAddress: null == blockradarAddress
          ? _value.blockradarAddress
          : blockradarAddress // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      resetTokenExpiry: freezed == resetTokenExpiry
          ? _value.resetTokenExpiry
          : resetTokenExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authProvider: null == authProvider
          ? _value.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: '_id') this.id = '',
      this.token = '',
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'updated_at')
      this.updatedAt,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'created_at')
      this.createdAt,
      @JsonKey(name: 'first_name') this.firstName = '',
      @JsonKey(name: 'last_name') this.lastName = '',
      this.email = '',
      this.phone = '',
      this.username = '',
      @JsonKey(name: 'username_slug') this.usernameSlug = '',
      @JsonKey(name: 'blockradar_address') this.blockradarAddress = '',
      @JsonKey(name: 'profile_photo') this.profilePhoto = '',
      @JsonKey(name: 'is_deleted') this.isDeleted = false,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'reset_token_expiry')
      this.resetTokenExpiry,
      @JsonKey(name: 'auth_provider') this.authProvider = ''});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey(name: 'username_slug')
  final String usernameSlug;
  @override
  @JsonKey(name: 'blockradar_address')
  final String blockradarAddress;
  @override
  @JsonKey(name: 'profile_photo')
  final String profilePhoto;
  @override
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @override
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'reset_token_expiry')
  final DateTime? resetTokenExpiry;
  @override
  @JsonKey(name: 'auth_provider')
  final String authProvider;

  @override
  String toString() {
    return 'User(id: $id, token: $token, updatedAt: $updatedAt, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, username: $username, usernameSlug: $usernameSlug, blockradarAddress: $blockradarAddress, profilePhoto: $profilePhoto, isDeleted: $isDeleted, resetTokenExpiry: $resetTokenExpiry, authProvider: $authProvider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.usernameSlug, usernameSlug) ||
                other.usernameSlug == usernameSlug) &&
            (identical(other.blockradarAddress, blockradarAddress) ||
                other.blockradarAddress == blockradarAddress) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.resetTokenExpiry, resetTokenExpiry) ||
                other.resetTokenExpiry == resetTokenExpiry) &&
            (identical(other.authProvider, authProvider) ||
                other.authProvider == authProvider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      token,
      updatedAt,
      createdAt,
      firstName,
      lastName,
      email,
      phone,
      username,
      usernameSlug,
      blockradarAddress,
      profilePhoto,
      isDeleted,
      resetTokenExpiry,
      authProvider);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '_id') final String id,
      final String token,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'updated_at')
      final DateTime? updatedAt,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'created_at')
      final DateTime? createdAt,
      @JsonKey(name: 'first_name') final String firstName,
      @JsonKey(name: 'last_name') final String lastName,
      final String email,
      final String phone,
      final String username,
      @JsonKey(name: 'username_slug') final String usernameSlug,
      @JsonKey(name: 'blockradar_address') final String blockradarAddress,
      @JsonKey(name: 'profile_photo') final String profilePhoto,
      @JsonKey(name: 'is_deleted') final bool isDeleted,
      @JsonKey(
          toJson: ModelHelper.localDateTimeToUtcIsoStr,
          fromJson: ModelHelper.strToLocalDateTime,
          name: 'reset_token_expiry')
      final DateTime? resetTokenExpiry,
      @JsonKey(name: 'auth_provider') final String authProvider}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get token;
  @override
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get username;
  @override
  @JsonKey(name: 'username_slug')
  String get usernameSlug;
  @override
  @JsonKey(name: 'blockradar_address')
  String get blockradarAddress;
  @override
  @JsonKey(name: 'profile_photo')
  String get profilePhoto;
  @override
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;
  @override
  @JsonKey(
      toJson: ModelHelper.localDateTimeToUtcIsoStr,
      fromJson: ModelHelper.strToLocalDateTime,
      name: 'reset_token_expiry')
  DateTime? get resetTokenExpiry;
  @override
  @JsonKey(name: 'auth_provider')
  String get authProvider;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
