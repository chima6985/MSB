// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_points_and_position_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerPointsAndPositionState {
  List<PlayerPosition>? get players => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PlayerPosition> players) initial,
    required TResult Function(List<PlayerPosition>? players) loading,
    required TResult Function(List<PlayerPosition> players) loaded,
    required TResult Function(List<PlayerPosition>? players, String? error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PlayerPosition> players)? initial,
    TResult? Function(List<PlayerPosition>? players)? loading,
    TResult? Function(List<PlayerPosition> players)? loaded,
    TResult? Function(List<PlayerPosition>? players, String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PlayerPosition> players)? initial,
    TResult Function(List<PlayerPosition>? players)? loading,
    TResult Function(List<PlayerPosition> players)? loaded,
    TResult Function(List<PlayerPosition>? players, String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerPointsAndPositionStateCopyWith<PlayerPointsAndPositionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPointsAndPositionStateCopyWith<$Res> {
  factory $PlayerPointsAndPositionStateCopyWith(
          PlayerPointsAndPositionState value,
          $Res Function(PlayerPointsAndPositionState) then) =
      _$PlayerPointsAndPositionStateCopyWithImpl<$Res,
          PlayerPointsAndPositionState>;
  @useResult
  $Res call({List<PlayerPosition> players});
}

/// @nodoc
class _$PlayerPointsAndPositionStateCopyWithImpl<$Res,
        $Val extends PlayerPointsAndPositionState>
    implements $PlayerPointsAndPositionStateCopyWith<$Res> {
  _$PlayerPointsAndPositionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      players: null == players
          ? _value.players!
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PlayerPointsAndPositionStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlayerPosition> players});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlayerPointsAndPositionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
  }) {
    return _then(_$InitialImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<PlayerPosition> players = const <PlayerPosition>[]})
      : _players = players;

  final List<PlayerPosition> _players;
  @override
  @JsonKey()
  List<PlayerPosition> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'PlayerPointsAndPositionState.initial(players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_players));

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PlayerPosition> players) initial,
    required TResult Function(List<PlayerPosition>? players) loading,
    required TResult Function(List<PlayerPosition> players) loaded,
    required TResult Function(List<PlayerPosition>? players, String? error)
        error,
  }) {
    return initial(players);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PlayerPosition> players)? initial,
    TResult? Function(List<PlayerPosition>? players)? loading,
    TResult? Function(List<PlayerPosition> players)? loaded,
    TResult? Function(List<PlayerPosition>? players, String? error)? error,
  }) {
    return initial?.call(players);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PlayerPosition> players)? initial,
    TResult Function(List<PlayerPosition>? players)? loading,
    TResult Function(List<PlayerPosition> players)? loaded,
    TResult Function(List<PlayerPosition>? players, String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(players);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlayerPointsAndPositionState {
  const factory _Initial({final List<PlayerPosition> players}) = _$InitialImpl;

  @override
  List<PlayerPosition> get players;

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $PlayerPointsAndPositionStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlayerPosition>? players});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PlayerPointsAndPositionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = freezed,
  }) {
    return _then(_$LoadingImpl(
      players: freezed == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({final List<PlayerPosition>? players})
      : _players = players;

  final List<PlayerPosition>? _players;
  @override
  List<PlayerPosition>? get players {
    final value = _players;
    if (value == null) return null;
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlayerPointsAndPositionState.loading(players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_players));

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PlayerPosition> players) initial,
    required TResult Function(List<PlayerPosition>? players) loading,
    required TResult Function(List<PlayerPosition> players) loaded,
    required TResult Function(List<PlayerPosition>? players, String? error)
        error,
  }) {
    return loading(players);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PlayerPosition> players)? initial,
    TResult? Function(List<PlayerPosition>? players)? loading,
    TResult? Function(List<PlayerPosition> players)? loaded,
    TResult? Function(List<PlayerPosition>? players, String? error)? error,
  }) {
    return loading?.call(players);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PlayerPosition> players)? initial,
    TResult Function(List<PlayerPosition>? players)? loading,
    TResult Function(List<PlayerPosition> players)? loaded,
    TResult Function(List<PlayerPosition>? players, String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(players);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PlayerPointsAndPositionState {
  const factory _Loading({final List<PlayerPosition>? players}) = _$LoadingImpl;

  @override
  List<PlayerPosition>? get players;

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $PlayerPointsAndPositionStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlayerPosition> players});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PlayerPointsAndPositionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
  }) {
    return _then(_$LoadedImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final List<PlayerPosition> players})
      : _players = players;

  final List<PlayerPosition> _players;
  @override
  List<PlayerPosition> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'PlayerPointsAndPositionState.loaded(players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_players));

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PlayerPosition> players) initial,
    required TResult Function(List<PlayerPosition>? players) loading,
    required TResult Function(List<PlayerPosition> players) loaded,
    required TResult Function(List<PlayerPosition>? players, String? error)
        error,
  }) {
    return loaded(players);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PlayerPosition> players)? initial,
    TResult? Function(List<PlayerPosition>? players)? loading,
    TResult? Function(List<PlayerPosition> players)? loaded,
    TResult? Function(List<PlayerPosition>? players, String? error)? error,
  }) {
    return loaded?.call(players);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PlayerPosition> players)? initial,
    TResult Function(List<PlayerPosition>? players)? loading,
    TResult Function(List<PlayerPosition> players)? loaded,
    TResult Function(List<PlayerPosition>? players, String? error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(players);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PlayerPointsAndPositionState {
  const factory _Loaded({required final List<PlayerPosition> players}) =
      _$LoadedImpl;

  @override
  List<PlayerPosition> get players;

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $PlayerPointsAndPositionStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlayerPosition>? players, String? error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PlayerPointsAndPositionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ErrorImpl(
      players: freezed == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({final List<PlayerPosition>? players, this.error})
      : _players = players;

  final List<PlayerPosition>? _players;
  @override
  List<PlayerPosition>? get players {
    final value = _players;
    if (value == null) return null;
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'PlayerPointsAndPositionState.error(players: $players, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_players), error);

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PlayerPosition> players) initial,
    required TResult Function(List<PlayerPosition>? players) loading,
    required TResult Function(List<PlayerPosition> players) loaded,
    required TResult Function(List<PlayerPosition>? players, String? error)
        error,
  }) {
    return error(players, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PlayerPosition> players)? initial,
    TResult? Function(List<PlayerPosition>? players)? loading,
    TResult? Function(List<PlayerPosition> players)? loaded,
    TResult? Function(List<PlayerPosition>? players, String? error)? error,
  }) {
    return error?.call(players, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PlayerPosition> players)? initial,
    TResult Function(List<PlayerPosition>? players)? loading,
    TResult Function(List<PlayerPosition> players)? loaded,
    TResult Function(List<PlayerPosition>? players, String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(players, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PlayerPointsAndPositionState {
  const factory _Error(
      {final List<PlayerPosition>? players, final String? error}) = _$ErrorImpl;

  @override
  List<PlayerPosition>? get players;
  String? get error;

  /// Create a copy of PlayerPointsAndPositionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
