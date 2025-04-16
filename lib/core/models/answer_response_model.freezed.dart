// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerResponse _$AnswerResponseFromJson(Map<String, dynamic> json) {
  return _AnswerResponse.fromJson(json);
}

/// @nodoc
mixin _$AnswerResponse {
  String get message => throw _privateConstructorUsedError;
  int get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'coins_earned')
  int get coinsEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_lives')
  int get totalLives => throw _privateConstructorUsedError;
  String get timeSpent => throw _privateConstructorUsedError;

  /// Serializes this AnswerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerResponseCopyWith<AnswerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerResponseCopyWith<$Res> {
  factory $AnswerResponseCopyWith(
          AnswerResponse value, $Res Function(AnswerResponse) then) =
      _$AnswerResponseCopyWithImpl<$Res, AnswerResponse>;
  @useResult
  $Res call(
      {String message,
      int accuracy,
      @JsonKey(name: 'coins_earned') int coinsEarned,
      @JsonKey(name: 'total_lives') int totalLives,
      String timeSpent});
}

/// @nodoc
class _$AnswerResponseCopyWithImpl<$Res, $Val extends AnswerResponse>
    implements $AnswerResponseCopyWith<$Res> {
  _$AnswerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? accuracy = null,
    Object? coinsEarned = null,
    Object? totalLives = null,
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
      coinsEarned: null == coinsEarned
          ? _value.coinsEarned
          : coinsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalLives: null == totalLives
          ? _value.totalLives
          : totalLives // ignore: cast_nullable_to_non_nullable
              as int,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerResponseImplCopyWith<$Res>
    implements $AnswerResponseCopyWith<$Res> {
  factory _$$AnswerResponseImplCopyWith(_$AnswerResponseImpl value,
          $Res Function(_$AnswerResponseImpl) then) =
      __$$AnswerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      int accuracy,
      @JsonKey(name: 'coins_earned') int coinsEarned,
      @JsonKey(name: 'total_lives') int totalLives,
      String timeSpent});
}

/// @nodoc
class __$$AnswerResponseImplCopyWithImpl<$Res>
    extends _$AnswerResponseCopyWithImpl<$Res, _$AnswerResponseImpl>
    implements _$$AnswerResponseImplCopyWith<$Res> {
  __$$AnswerResponseImplCopyWithImpl(
      _$AnswerResponseImpl _value, $Res Function(_$AnswerResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? accuracy = null,
    Object? coinsEarned = null,
    Object? totalLives = null,
    Object? timeSpent = null,
  }) {
    return _then(_$AnswerResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      coinsEarned: null == coinsEarned
          ? _value.coinsEarned
          : coinsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalLives: null == totalLives
          ? _value.totalLives
          : totalLives // ignore: cast_nullable_to_non_nullable
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
class _$AnswerResponseImpl implements _AnswerResponse {
  const _$AnswerResponseImpl(
      {this.message = '',
      this.accuracy = 0,
      @JsonKey(name: 'coins_earned') this.coinsEarned = 0,
      @JsonKey(name: 'total_lives') this.totalLives = 0,
      this.timeSpent = ''});

  factory _$AnswerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerResponseImplFromJson(json);

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int accuracy;
  @override
  @JsonKey(name: 'coins_earned')
  final int coinsEarned;
  @override
  @JsonKey(name: 'total_lives')
  final int totalLives;
  @override
  @JsonKey()
  final String timeSpent;

  @override
  String toString() {
    return 'AnswerResponse(message: $message, accuracy: $accuracy, coinsEarned: $coinsEarned, totalLives: $totalLives, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.coinsEarned, coinsEarned) ||
                other.coinsEarned == coinsEarned) &&
            (identical(other.totalLives, totalLives) ||
                other.totalLives == totalLives) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, accuracy, coinsEarned, totalLives, timeSpent);

  /// Create a copy of AnswerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerResponseImplCopyWith<_$AnswerResponseImpl> get copyWith =>
      __$$AnswerResponseImplCopyWithImpl<_$AnswerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerResponseImplToJson(
      this,
    );
  }
}

abstract class _AnswerResponse implements AnswerResponse {
  const factory _AnswerResponse(
      {final String message,
      final int accuracy,
      @JsonKey(name: 'coins_earned') final int coinsEarned,
      @JsonKey(name: 'total_lives') final int totalLives,
      final String timeSpent}) = _$AnswerResponseImpl;

  factory _AnswerResponse.fromJson(Map<String, dynamic> json) =
      _$AnswerResponseImpl.fromJson;

  @override
  String get message;
  @override
  int get accuracy;
  @override
  @JsonKey(name: 'coins_earned')
  int get coinsEarned;
  @override
  @JsonKey(name: 'total_lives')
  int get totalLives;
  @override
  String get timeSpent;

  /// Create a copy of AnswerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerResponseImplCopyWith<_$AnswerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
