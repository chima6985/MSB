// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_age_range_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyAgeRange _$SurveyAgeRangeFromJson(Map<String, dynamic> json) {
  return _SurveyAgeRange.fromJson(json);
}

/// @nodoc
mixin _$SurveyAgeRange {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this SurveyAgeRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveyAgeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyAgeRangeCopyWith<SurveyAgeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyAgeRangeCopyWith<$Res> {
  factory $SurveyAgeRangeCopyWith(
          SurveyAgeRange value, $Res Function(SurveyAgeRange) then) =
      _$SurveyAgeRangeCopyWithImpl<$Res, SurveyAgeRange>;
  @useResult
  $Res call({String id, String label, String value, int order});
}

/// @nodoc
class _$SurveyAgeRangeCopyWithImpl<$Res, $Val extends SurveyAgeRange>
    implements $SurveyAgeRangeCopyWith<$Res> {
  _$SurveyAgeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveyAgeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? value = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyAgeRangeImplCopyWith<$Res>
    implements $SurveyAgeRangeCopyWith<$Res> {
  factory _$$SurveyAgeRangeImplCopyWith(_$SurveyAgeRangeImpl value,
          $Res Function(_$SurveyAgeRangeImpl) then) =
      __$$SurveyAgeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, String value, int order});
}

/// @nodoc
class __$$SurveyAgeRangeImplCopyWithImpl<$Res>
    extends _$SurveyAgeRangeCopyWithImpl<$Res, _$SurveyAgeRangeImpl>
    implements _$$SurveyAgeRangeImplCopyWith<$Res> {
  __$$SurveyAgeRangeImplCopyWithImpl(
      _$SurveyAgeRangeImpl _value, $Res Function(_$SurveyAgeRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of SurveyAgeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? value = null,
    Object? order = null,
  }) {
    return _then(_$SurveyAgeRangeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyAgeRangeImpl implements _SurveyAgeRange {
  const _$SurveyAgeRangeImpl(
      {this.id = '', this.label = '', this.value = '', this.order = 0});

  factory _$SurveyAgeRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyAgeRangeImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final int order;

  @override
  String toString() {
    return 'SurveyAgeRange(id: $id, label: $label, value: $value, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyAgeRangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, value, order);

  /// Create a copy of SurveyAgeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyAgeRangeImplCopyWith<_$SurveyAgeRangeImpl> get copyWith =>
      __$$SurveyAgeRangeImplCopyWithImpl<_$SurveyAgeRangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyAgeRangeImplToJson(
      this,
    );
  }
}

abstract class _SurveyAgeRange implements SurveyAgeRange {
  const factory _SurveyAgeRange(
      {final String id,
      final String label,
      final String value,
      final int order}) = _$SurveyAgeRangeImpl;

  factory _SurveyAgeRange.fromJson(Map<String, dynamic> json) =
      _$SurveyAgeRangeImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get value;
  @override
  int get order;

  /// Create a copy of SurveyAgeRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyAgeRangeImplCopyWith<_$SurveyAgeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
