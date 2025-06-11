// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerPosition _$PlayerPositionFromJson(Map<String, dynamic> json) {
  return _PlayerPosition.fromJson(json);
}

/// @nodoc
mixin _$PlayerPosition {
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this PlayerPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerPositionCopyWith<PlayerPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPositionCopyWith<$Res> {
  factory $PlayerPositionCopyWith(
          PlayerPosition value, $Res Function(PlayerPosition) then) =
      _$PlayerPositionCopyWithImpl<$Res, PlayerPosition>;
  @useResult
  $Res call({String userId, String username, int points, int position});
}

/// @nodoc
class _$PlayerPositionCopyWithImpl<$Res, $Val extends PlayerPosition>
    implements $PlayerPositionCopyWith<$Res> {
  _$PlayerPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? points = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerPositionImplCopyWith<$Res>
    implements $PlayerPositionCopyWith<$Res> {
  factory _$$PlayerPositionImplCopyWith(_$PlayerPositionImpl value,
          $Res Function(_$PlayerPositionImpl) then) =
      __$$PlayerPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String username, int points, int position});
}

/// @nodoc
class __$$PlayerPositionImplCopyWithImpl<$Res>
    extends _$PlayerPositionCopyWithImpl<$Res, _$PlayerPositionImpl>
    implements _$$PlayerPositionImplCopyWith<$Res> {
  __$$PlayerPositionImplCopyWithImpl(
      _$PlayerPositionImpl _value, $Res Function(_$PlayerPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? points = null,
    Object? position = null,
  }) {
    return _then(_$PlayerPositionImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerPositionImpl implements _PlayerPosition {
  const _$PlayerPositionImpl(
      {this.userId = '',
      this.username = '',
      this.points = 0,
      this.position = 0});

  factory _$PlayerPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerPositionImplFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final int points;
  @override
  @JsonKey()
  final int position;

  @override
  String toString() {
    return 'PlayerPosition(userId: $userId, username: $username, points: $points, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerPositionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, username, points, position);

  /// Create a copy of PlayerPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerPositionImplCopyWith<_$PlayerPositionImpl> get copyWith =>
      __$$PlayerPositionImplCopyWithImpl<_$PlayerPositionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerPositionImplToJson(
      this,
    );
  }
}

abstract class _PlayerPosition implements PlayerPosition {
  const factory _PlayerPosition(
      {final String userId,
      final String username,
      final int points,
      final int position}) = _$PlayerPositionImpl;

  factory _PlayerPosition.fromJson(Map<String, dynamic> json) =
      _$PlayerPositionImpl.fromJson;

  @override
  String get userId;
  @override
  String get username;
  @override
  int get points;
  @override
  int get position;

  /// Create a copy of PlayerPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerPositionImplCopyWith<_$PlayerPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
