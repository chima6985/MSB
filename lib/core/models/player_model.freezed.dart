// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  @JsonKey(name: 'game_player_id')
  String get section => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get difficulty => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_game_master')
  bool get isGameMaster => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_team_leader')
  bool get isTeamLeader => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {@JsonKey(name: 'game_player_id') String section,
      @JsonKey(name: 'user_id') String difficulty,
      String username,
      @JsonKey(name: 'is_game_master') bool isGameMaster,
      @JsonKey(name: 'is_team_leader') bool isTeamLeader,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? section = null,
    Object? difficulty = null,
    Object? username = null,
    Object? isGameMaster = null,
    Object? isTeamLeader = null,
    Object? imageUrl = freezed,
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
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isGameMaster: null == isGameMaster
          ? _value.isGameMaster
          : isGameMaster // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeamLeader: null == isTeamLeader
          ? _value.isTeamLeader
          : isTeamLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'game_player_id') String section,
      @JsonKey(name: 'user_id') String difficulty,
      String username,
      @JsonKey(name: 'is_game_master') bool isGameMaster,
      @JsonKey(name: 'is_team_leader') bool isTeamLeader,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? section = null,
    Object? difficulty = null,
    Object? username = null,
    Object? isGameMaster = null,
    Object? isTeamLeader = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$PlayerImpl(
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isGameMaster: null == isGameMaster
          ? _value.isGameMaster
          : isGameMaster // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeamLeader: null == isTeamLeader
          ? _value.isTeamLeader
          : isTeamLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  const _$PlayerImpl(
      {@JsonKey(name: 'game_player_id') this.section = '',
      @JsonKey(name: 'user_id') this.difficulty = '',
      this.username = '',
      @JsonKey(name: 'is_game_master') this.isGameMaster = false,
      @JsonKey(name: 'is_team_leader') this.isTeamLeader = false,
      @JsonKey(name: 'image_url') this.imageUrl = ''});

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  @JsonKey(name: 'game_player_id')
  final String section;
  @override
  @JsonKey(name: 'user_id')
  final String difficulty;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey(name: 'is_game_master')
  final bool isGameMaster;
  @override
  @JsonKey(name: 'is_team_leader')
  final bool isTeamLeader;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'Player(section: $section, difficulty: $difficulty, username: $username, isGameMaster: $isGameMaster, isTeamLeader: $isTeamLeader, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isGameMaster, isGameMaster) ||
                other.isGameMaster == isGameMaster) &&
            (identical(other.isTeamLeader, isTeamLeader) ||
                other.isTeamLeader == isTeamLeader) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, section, difficulty, username,
      isGameMaster, isTeamLeader, imageUrl);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {@JsonKey(name: 'game_player_id') final String section,
      @JsonKey(name: 'user_id') final String difficulty,
      final String username,
      @JsonKey(name: 'is_game_master') final bool isGameMaster,
      @JsonKey(name: 'is_team_leader') final bool isTeamLeader,
      @JsonKey(name: 'image_url') final String? imageUrl}) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  @JsonKey(name: 'game_player_id')
  String get section;
  @override
  @JsonKey(name: 'user_id')
  String get difficulty;
  @override
  String get username;
  @override
  @JsonKey(name: 'is_game_master')
  bool get isGameMaster;
  @override
  @JsonKey(name: 'is_team_leader')
  bool get isTeamLeader;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
