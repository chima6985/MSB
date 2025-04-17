// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerStat _$PlayerStatFromJson(Map<String, dynamic> json) {
  return _PlayerStat.fromJson(json);
}

/// @nodoc
mixin _$PlayerStat {
  String get message => throw _privateConstructorUsedError;
  int get accuracy => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError;
  String get timeSpent => throw _privateConstructorUsedError;

  /// Serializes this PlayerStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerStatCopyWith<PlayerStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStatCopyWith<$Res> {
  factory $PlayerStatCopyWith(
          PlayerStat value, $Res Function(PlayerStat) then) =
      _$PlayerStatCopyWithImpl<$Res, PlayerStat>;
  @useResult
  $Res call({String message, int accuracy, int coins, String timeSpent});
}

/// @nodoc
class _$PlayerStatCopyWithImpl<$Res, $Val extends PlayerStat>
    implements $PlayerStatCopyWith<$Res> {
  _$PlayerStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? accuracy = null,
    Object? coins = null,
    Object? timeSpent = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStatImplCopyWith<$Res>
    implements $PlayerStatCopyWith<$Res> {
  factory _$$PlayerStatImplCopyWith(
          _$PlayerStatImpl value, $Res Function(_$PlayerStatImpl) then) =
      __$$PlayerStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int accuracy, int coins, String timeSpent});
}

/// @nodoc
class __$$PlayerStatImplCopyWithImpl<$Res>
    extends _$PlayerStatCopyWithImpl<$Res, _$PlayerStatImpl>
    implements _$$PlayerStatImplCopyWith<$Res> {
  __$$PlayerStatImplCopyWithImpl(
      _$PlayerStatImpl _value, $Res Function(_$PlayerStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? accuracy = null,
    Object? coins = null,
    Object? timeSpent = null,
  }) {
    return _then(_$PlayerStatImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerStatImpl implements _PlayerStat {
  const _$PlayerStatImpl(
      {this.message = '',
      this.accuracy = 0,
      this.coins = 0,
      this.timeSpent = ''});

  factory _$PlayerStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerStatImplFromJson(json);

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int accuracy;
  @override
  @JsonKey()
  final int coins;
  @override
  @JsonKey()
  final String timeSpent;

  @override
  String toString() {
    return 'PlayerStat(message: $message, accuracy: $accuracy, coins: $coins, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStatImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, accuracy, coins, timeSpent);

  /// Create a copy of PlayerStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStatImplCopyWith<_$PlayerStatImpl> get copyWith =>
      __$$PlayerStatImplCopyWithImpl<_$PlayerStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerStatImplToJson(
      this,
    );
  }
}

abstract class _PlayerStat implements PlayerStat {
  const factory _PlayerStat(
      {final String message,
      final int accuracy,
      final int coins,
      final String timeSpent}) = _$PlayerStatImpl;

  factory _PlayerStat.fromJson(Map<String, dynamic> json) =
      _$PlayerStatImpl.fromJson;

  @override
  String get message;
  @override
  int get accuracy;
  @override
  int get coins;
  @override
  String get timeSpent;

  /// Create a copy of PlayerStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerStatImplCopyWith<_$PlayerStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
