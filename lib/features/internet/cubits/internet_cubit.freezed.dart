// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InternetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(ConnectionType connectionType) connected,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(ConnectionType connectionType)? connected,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(ConnectionType connectionType)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternetStateCopyWith<$Res> {
  factory $InternetStateCopyWith(
          InternetState value, $Res Function(InternetState) then) =
      _$InternetStateCopyWithImpl<$Res, InternetState>;
}

/// @nodoc
class _$InternetStateCopyWithImpl<$Res, $Val extends InternetState>
    implements $InternetStateCopyWith<$Res> {
  _$InternetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InternetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$InternetStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InternetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectingImpl implements _Connecting {
  const _$ConnectingImpl();

  @override
  String toString() {
    return 'InternetState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(ConnectionType connectionType) connected,
    required TResult Function() disconnected,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(ConnectionType connectionType)? connected,
    TResult? Function()? disconnected,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(ConnectionType connectionType)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements InternetState {
  const factory _Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConnectionType connectionType});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$InternetStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InternetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionType = null,
  }) {
    return _then(_$ConnectedImpl(
      connectionType: null == connectionType
          ? _value.connectionType
          : connectionType // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl({required this.connectionType});

  @override
  final ConnectionType connectionType;

  @override
  String toString() {
    return 'InternetState.connected(connectionType: $connectionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.connectionType, connectionType) ||
                other.connectionType == connectionType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectionType);

  /// Create a copy of InternetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(ConnectionType connectionType) connected,
    required TResult Function() disconnected,
  }) {
    return connected(connectionType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(ConnectionType connectionType)? connected,
    TResult? Function()? disconnected,
  }) {
    return connected?.call(connectionType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(ConnectionType connectionType)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(connectionType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements InternetState {
  const factory _Connected({required final ConnectionType connectionType}) =
      _$ConnectedImpl;

  ConnectionType get connectionType;

  /// Create a copy of InternetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$InternetStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InternetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisconnectedImpl implements _Disconnected {
  const _$DisconnectedImpl();

  @override
  String toString() {
    return 'InternetState.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(ConnectionType connectionType) connected,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(ConnectionType connectionType)? connected,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(ConnectionType connectionType)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements InternetState {
  const factory _Disconnected() = _$DisconnectedImpl;
}
