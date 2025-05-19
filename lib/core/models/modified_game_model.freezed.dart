// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modified_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModifiedGame _$ModifiedGameFromJson(Map<String, dynamic> json) {
  return _ModifiedGame.fromJson(json);
}

/// @nodoc
mixin _$ModifiedGame {
  @JsonKey(name: 'team_mode')
  bool get teamMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_formation')
  bool? get teamFormation => throw _privateConstructorUsedError;

  /// Serializes this ModifiedGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModifiedGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifiedGameCopyWith<ModifiedGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifiedGameCopyWith<$Res> {
  factory $ModifiedGameCopyWith(
          ModifiedGame value, $Res Function(ModifiedGame) then) =
      _$ModifiedGameCopyWithImpl<$Res, ModifiedGame>;
  @useResult
  $Res call(
      {@JsonKey(name: 'team_mode') bool teamMode,
      @JsonKey(name: 'team_formation') bool? teamFormation});
}

/// @nodoc
class _$ModifiedGameCopyWithImpl<$Res, $Val extends ModifiedGame>
    implements $ModifiedGameCopyWith<$Res> {
  _$ModifiedGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifiedGame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamMode = null,
    Object? teamFormation = freezed,
  }) {
    return _then(_value.copyWith(
      teamMode: null == teamMode
          ? _value.teamMode
          : teamMode // ignore: cast_nullable_to_non_nullable
              as bool,
      teamFormation: freezed == teamFormation
          ? _value.teamFormation
          : teamFormation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifiedGameImplCopyWith<$Res>
    implements $ModifiedGameCopyWith<$Res> {
  factory _$$ModifiedGameImplCopyWith(
          _$ModifiedGameImpl value, $Res Function(_$ModifiedGameImpl) then) =
      __$$ModifiedGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'team_mode') bool teamMode,
      @JsonKey(name: 'team_formation') bool? teamFormation});
}

/// @nodoc
class __$$ModifiedGameImplCopyWithImpl<$Res>
    extends _$ModifiedGameCopyWithImpl<$Res, _$ModifiedGameImpl>
    implements _$$ModifiedGameImplCopyWith<$Res> {
  __$$ModifiedGameImplCopyWithImpl(
      _$ModifiedGameImpl _value, $Res Function(_$ModifiedGameImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifiedGame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamMode = null,
    Object? teamFormation = freezed,
  }) {
    return _then(_$ModifiedGameImpl(
      teamMode: null == teamMode
          ? _value.teamMode
          : teamMode // ignore: cast_nullable_to_non_nullable
              as bool,
      teamFormation: freezed == teamFormation
          ? _value.teamFormation
          : teamFormation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModifiedGameImpl implements _ModifiedGame {
  const _$ModifiedGameImpl(
      {@JsonKey(name: 'team_mode') this.teamMode = false,
      @JsonKey(name: 'team_formation') this.teamFormation = null});

  factory _$ModifiedGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModifiedGameImplFromJson(json);

  @override
  @JsonKey(name: 'team_mode')
  final bool teamMode;
  @override
  @JsonKey(name: 'team_formation')
  final bool? teamFormation;

  @override
  String toString() {
    return 'ModifiedGame(teamMode: $teamMode, teamFormation: $teamFormation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifiedGameImpl &&
            (identical(other.teamMode, teamMode) ||
                other.teamMode == teamMode) &&
            (identical(other.teamFormation, teamFormation) ||
                other.teamFormation == teamFormation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, teamMode, teamFormation);

  /// Create a copy of ModifiedGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifiedGameImplCopyWith<_$ModifiedGameImpl> get copyWith =>
      __$$ModifiedGameImplCopyWithImpl<_$ModifiedGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModifiedGameImplToJson(
      this,
    );
  }
}

abstract class _ModifiedGame implements ModifiedGame {
  const factory _ModifiedGame(
          {@JsonKey(name: 'team_mode') final bool teamMode,
          @JsonKey(name: 'team_formation') final bool? teamFormation}) =
      _$ModifiedGameImpl;

  factory _ModifiedGame.fromJson(Map<String, dynamic> json) =
      _$ModifiedGameImpl.fromJson;

  @override
  @JsonKey(name: 'team_mode')
  bool get teamMode;
  @override
  @JsonKey(name: 'team_formation')
  bool? get teamFormation;

  /// Create a copy of ModifiedGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifiedGameImplCopyWith<_$ModifiedGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
