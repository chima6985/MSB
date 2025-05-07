// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameDetails _$GameDetailsFromJson(Map<String, dynamic> json) {
  return _GameDetails.fromJson(json);
}

/// @nodoc
mixin _$GameDetails {
  String get section => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_mode')
  bool get teamMode => throw _privateConstructorUsedError;

  /// Serializes this GameDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameDetailsCopyWith<GameDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDetailsCopyWith<$Res> {
  factory $GameDetailsCopyWith(
          GameDetails value, $Res Function(GameDetails) then) =
      _$GameDetailsCopyWithImpl<$Res, GameDetails>;
  @useResult
  $Res call(
      {String section,
      String difficulty,
      @JsonKey(name: 'team_mode') bool teamMode});
}

/// @nodoc
class _$GameDetailsCopyWithImpl<$Res, $Val extends GameDetails>
    implements $GameDetailsCopyWith<$Res> {
  _$GameDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? section = null,
    Object? difficulty = null,
    Object? teamMode = null,
  }) {
    return _then(_value.copyWith(
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      teamMode: null == teamMode
          ? _value.teamMode
          : teamMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameDetailsImplCopyWith<$Res>
    implements $GameDetailsCopyWith<$Res> {
  factory _$$GameDetailsImplCopyWith(
          _$GameDetailsImpl value, $Res Function(_$GameDetailsImpl) then) =
      __$$GameDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String section,
      String difficulty,
      @JsonKey(name: 'team_mode') bool teamMode});
}

/// @nodoc
class __$$GameDetailsImplCopyWithImpl<$Res>
    extends _$GameDetailsCopyWithImpl<$Res, _$GameDetailsImpl>
    implements _$$GameDetailsImplCopyWith<$Res> {
  __$$GameDetailsImplCopyWithImpl(
      _$GameDetailsImpl _value, $Res Function(_$GameDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? section = null,
    Object? difficulty = null,
    Object? teamMode = null,
  }) {
    return _then(_$GameDetailsImpl(
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      teamMode: null == teamMode
          ? _value.teamMode
          : teamMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDetailsImpl implements _GameDetails {
  const _$GameDetailsImpl(
      {this.section = '',
      this.difficulty = '',
      @JsonKey(name: 'team_mode') this.teamMode = false});

  factory _$GameDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDetailsImplFromJson(json);

  @override
  @JsonKey()
  final String section;
  @override
  @JsonKey()
  final String difficulty;
  @override
  @JsonKey(name: 'team_mode')
  final bool teamMode;

  @override
  String toString() {
    return 'GameDetails(section: $section, difficulty: $difficulty, teamMode: $teamMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDetailsImpl &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.teamMode, teamMode) ||
                other.teamMode == teamMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, section, difficulty, teamMode);

  /// Create a copy of GameDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDetailsImplCopyWith<_$GameDetailsImpl> get copyWith =>
      __$$GameDetailsImplCopyWithImpl<_$GameDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameDetailsImplToJson(
      this,
    );
  }
}

abstract class _GameDetails implements GameDetails {
  const factory _GameDetails(
      {final String section,
      final String difficulty,
      @JsonKey(name: 'team_mode') final bool teamMode}) = _$GameDetailsImpl;

  factory _GameDetails.fromJson(Map<String, dynamic> json) =
      _$GameDetailsImpl.fromJson;

  @override
  String get section;
  @override
  String get difficulty;
  @override
  @JsonKey(name: 'team_mode')
  bool get teamMode;

  /// Create a copy of GameDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameDetailsImplCopyWith<_$GameDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
