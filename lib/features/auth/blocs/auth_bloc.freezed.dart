// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authAppStarted,
    required TResult Function(
            String email, String password, String reenterPassword)
        authSignUp,
    required TResult Function(String email, String password) authSignIn,
    required TResult Function(String? message) authSignOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authAppStarted,
    TResult? Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult? Function(String email, String password)? authSignIn,
    TResult? Function(String? message)? authSignOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authAppStarted,
    TResult Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult Function(String email, String password)? authSignIn,
    TResult Function(String? message)? authSignOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthAppStarted value) authAppStarted,
    required TResult Function(_AuthSignUp value) authSignUp,
    required TResult Function(_AuthSignIn value) authSignIn,
    required TResult Function(_AuthSignOut value) authSignOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthAppStarted value)? authAppStarted,
    TResult? Function(_AuthSignUp value)? authSignUp,
    TResult? Function(_AuthSignIn value)? authSignIn,
    TResult? Function(_AuthSignOut value)? authSignOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthAppStarted value)? authAppStarted,
    TResult Function(_AuthSignUp value)? authSignUp,
    TResult Function(_AuthSignIn value)? authSignIn,
    TResult Function(_AuthSignOut value)? authSignOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthAppStartedImplCopyWith<$Res> {
  factory _$$AuthAppStartedImplCopyWith(_$AuthAppStartedImpl value,
          $Res Function(_$AuthAppStartedImpl) then) =
      __$$AuthAppStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthAppStartedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthAppStartedImpl>
    implements _$$AuthAppStartedImplCopyWith<$Res> {
  __$$AuthAppStartedImplCopyWithImpl(
      _$AuthAppStartedImpl _value, $Res Function(_$AuthAppStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthAppStartedImpl implements _AuthAppStarted {
  const _$AuthAppStartedImpl();

  @override
  String toString() {
    return 'AuthEvent.authAppStarted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthAppStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authAppStarted,
    required TResult Function(
            String email, String password, String reenterPassword)
        authSignUp,
    required TResult Function(String email, String password) authSignIn,
    required TResult Function(String? message) authSignOut,
  }) {
    return authAppStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authAppStarted,
    TResult? Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult? Function(String email, String password)? authSignIn,
    TResult? Function(String? message)? authSignOut,
  }) {
    return authAppStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authAppStarted,
    TResult Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult Function(String email, String password)? authSignIn,
    TResult Function(String? message)? authSignOut,
    required TResult orElse(),
  }) {
    if (authAppStarted != null) {
      return authAppStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthAppStarted value) authAppStarted,
    required TResult Function(_AuthSignUp value) authSignUp,
    required TResult Function(_AuthSignIn value) authSignIn,
    required TResult Function(_AuthSignOut value) authSignOut,
  }) {
    return authAppStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthAppStarted value)? authAppStarted,
    TResult? Function(_AuthSignUp value)? authSignUp,
    TResult? Function(_AuthSignIn value)? authSignIn,
    TResult? Function(_AuthSignOut value)? authSignOut,
  }) {
    return authAppStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthAppStarted value)? authAppStarted,
    TResult Function(_AuthSignUp value)? authSignUp,
    TResult Function(_AuthSignIn value)? authSignIn,
    TResult Function(_AuthSignOut value)? authSignOut,
    required TResult orElse(),
  }) {
    if (authAppStarted != null) {
      return authAppStarted(this);
    }
    return orElse();
  }
}

abstract class _AuthAppStarted implements AuthEvent {
  const factory _AuthAppStarted() = _$AuthAppStartedImpl;
}

/// @nodoc
abstract class _$$AuthSignUpImplCopyWith<$Res> {
  factory _$$AuthSignUpImplCopyWith(
          _$AuthSignUpImpl value, $Res Function(_$AuthSignUpImpl) then) =
      __$$AuthSignUpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String reenterPassword});
}

/// @nodoc
class __$$AuthSignUpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignUpImpl>
    implements _$$AuthSignUpImplCopyWith<$Res> {
  __$$AuthSignUpImplCopyWithImpl(
      _$AuthSignUpImpl _value, $Res Function(_$AuthSignUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? reenterPassword = null,
  }) {
    return _then(_$AuthSignUpImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      reenterPassword: null == reenterPassword
          ? _value.reenterPassword
          : reenterPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignUpImpl implements _AuthSignUp {
  const _$AuthSignUpImpl(
      {required this.email,
      required this.password,
      required this.reenterPassword});

  @override
  final String email;
  @override
  final String password;
  @override
  final String reenterPassword;

  @override
  String toString() {
    return 'AuthEvent.authSignUp(email: $email, password: $password, reenterPassword: $reenterPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignUpImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.reenterPassword, reenterPassword) ||
                other.reenterPassword == reenterPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, reenterPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignUpImplCopyWith<_$AuthSignUpImpl> get copyWith =>
      __$$AuthSignUpImplCopyWithImpl<_$AuthSignUpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authAppStarted,
    required TResult Function(
            String email, String password, String reenterPassword)
        authSignUp,
    required TResult Function(String email, String password) authSignIn,
    required TResult Function(String? message) authSignOut,
  }) {
    return authSignUp(email, password, reenterPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authAppStarted,
    TResult? Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult? Function(String email, String password)? authSignIn,
    TResult? Function(String? message)? authSignOut,
  }) {
    return authSignUp?.call(email, password, reenterPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authAppStarted,
    TResult Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult Function(String email, String password)? authSignIn,
    TResult Function(String? message)? authSignOut,
    required TResult orElse(),
  }) {
    if (authSignUp != null) {
      return authSignUp(email, password, reenterPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthAppStarted value) authAppStarted,
    required TResult Function(_AuthSignUp value) authSignUp,
    required TResult Function(_AuthSignIn value) authSignIn,
    required TResult Function(_AuthSignOut value) authSignOut,
  }) {
    return authSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthAppStarted value)? authAppStarted,
    TResult? Function(_AuthSignUp value)? authSignUp,
    TResult? Function(_AuthSignIn value)? authSignIn,
    TResult? Function(_AuthSignOut value)? authSignOut,
  }) {
    return authSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthAppStarted value)? authAppStarted,
    TResult Function(_AuthSignUp value)? authSignUp,
    TResult Function(_AuthSignIn value)? authSignIn,
    TResult Function(_AuthSignOut value)? authSignOut,
    required TResult orElse(),
  }) {
    if (authSignUp != null) {
      return authSignUp(this);
    }
    return orElse();
  }
}

abstract class _AuthSignUp implements AuthEvent {
  const factory _AuthSignUp(
      {required final String email,
      required final String password,
      required final String reenterPassword}) = _$AuthSignUpImpl;

  String get email;
  String get password;
  String get reenterPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSignUpImplCopyWith<_$AuthSignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignInImplCopyWith<$Res> {
  factory _$$AuthSignInImplCopyWith(
          _$AuthSignInImpl value, $Res Function(_$AuthSignInImpl) then) =
      __$$AuthSignInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthSignInImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignInImpl>
    implements _$$AuthSignInImplCopyWith<$Res> {
  __$$AuthSignInImplCopyWithImpl(
      _$AuthSignInImpl _value, $Res Function(_$AuthSignInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthSignInImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignInImpl implements _AuthSignIn {
  const _$AuthSignInImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.authSignIn(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignInImplCopyWith<_$AuthSignInImpl> get copyWith =>
      __$$AuthSignInImplCopyWithImpl<_$AuthSignInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authAppStarted,
    required TResult Function(
            String email, String password, String reenterPassword)
        authSignUp,
    required TResult Function(String email, String password) authSignIn,
    required TResult Function(String? message) authSignOut,
  }) {
    return authSignIn(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authAppStarted,
    TResult? Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult? Function(String email, String password)? authSignIn,
    TResult? Function(String? message)? authSignOut,
  }) {
    return authSignIn?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authAppStarted,
    TResult Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult Function(String email, String password)? authSignIn,
    TResult Function(String? message)? authSignOut,
    required TResult orElse(),
  }) {
    if (authSignIn != null) {
      return authSignIn(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthAppStarted value) authAppStarted,
    required TResult Function(_AuthSignUp value) authSignUp,
    required TResult Function(_AuthSignIn value) authSignIn,
    required TResult Function(_AuthSignOut value) authSignOut,
  }) {
    return authSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthAppStarted value)? authAppStarted,
    TResult? Function(_AuthSignUp value)? authSignUp,
    TResult? Function(_AuthSignIn value)? authSignIn,
    TResult? Function(_AuthSignOut value)? authSignOut,
  }) {
    return authSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthAppStarted value)? authAppStarted,
    TResult Function(_AuthSignUp value)? authSignUp,
    TResult Function(_AuthSignIn value)? authSignIn,
    TResult Function(_AuthSignOut value)? authSignOut,
    required TResult orElse(),
  }) {
    if (authSignIn != null) {
      return authSignIn(this);
    }
    return orElse();
  }
}

abstract class _AuthSignIn implements AuthEvent {
  const factory _AuthSignIn(
      {required final String email,
      required final String password}) = _$AuthSignInImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSignInImplCopyWith<_$AuthSignInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignOutImplCopyWith<$Res> {
  factory _$$AuthSignOutImplCopyWith(
          _$AuthSignOutImpl value, $Res Function(_$AuthSignOutImpl) then) =
      __$$AuthSignOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$AuthSignOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignOutImpl>
    implements _$$AuthSignOutImplCopyWith<$Res> {
  __$$AuthSignOutImplCopyWithImpl(
      _$AuthSignOutImpl _value, $Res Function(_$AuthSignOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AuthSignOutImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthSignOutImpl implements _AuthSignOut {
  const _$AuthSignOutImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthEvent.authSignOut(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignOutImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignOutImplCopyWith<_$AuthSignOutImpl> get copyWith =>
      __$$AuthSignOutImplCopyWithImpl<_$AuthSignOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authAppStarted,
    required TResult Function(
            String email, String password, String reenterPassword)
        authSignUp,
    required TResult Function(String email, String password) authSignIn,
    required TResult Function(String? message) authSignOut,
  }) {
    return authSignOut(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authAppStarted,
    TResult? Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult? Function(String email, String password)? authSignIn,
    TResult? Function(String? message)? authSignOut,
  }) {
    return authSignOut?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authAppStarted,
    TResult Function(String email, String password, String reenterPassword)?
        authSignUp,
    TResult Function(String email, String password)? authSignIn,
    TResult Function(String? message)? authSignOut,
    required TResult orElse(),
  }) {
    if (authSignOut != null) {
      return authSignOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthAppStarted value) authAppStarted,
    required TResult Function(_AuthSignUp value) authSignUp,
    required TResult Function(_AuthSignIn value) authSignIn,
    required TResult Function(_AuthSignOut value) authSignOut,
  }) {
    return authSignOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthAppStarted value)? authAppStarted,
    TResult? Function(_AuthSignUp value)? authSignUp,
    TResult? Function(_AuthSignIn value)? authSignIn,
    TResult? Function(_AuthSignOut value)? authSignOut,
  }) {
    return authSignOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthAppStarted value)? authAppStarted,
    TResult Function(_AuthSignUp value)? authSignUp,
    TResult Function(_AuthSignIn value)? authSignIn,
    TResult Function(_AuthSignOut value)? authSignOut,
    required TResult orElse(),
  }) {
    if (authSignOut != null) {
      return authSignOut(this);
    }
    return orElse();
  }
}

abstract class _AuthSignOut implements AuthEvent {
  const factory _AuthSignOut({final String? message}) = _$AuthSignOutImpl;

  String? get message;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSignOutImplCopyWith<_$AuthSignOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  User? get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user!
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthUnauthenticatedImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthUnauthenticatedImplCopyWith(_$AuthUnauthenticatedImpl value,
          $Res Function(_$AuthUnauthenticatedImpl) then) =
      __$$AuthUnauthenticatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? error});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticatedImpl>
    implements _$$AuthUnauthenticatedImplCopyWith<$Res> {
  __$$AuthUnauthenticatedImplCopyWithImpl(_$AuthUnauthenticatedImpl _value,
      $Res Function(_$AuthUnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AuthUnauthenticatedImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthUnauthenticatedImpl implements _AuthUnauthenticated {
  const _$AuthUnauthenticatedImpl({this.user, this.error});

  @override
  final User? user;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.unauthenticated(user: $user, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUnauthenticatedImplCopyWith<_$AuthUnauthenticatedImpl> get copyWith =>
      __$$AuthUnauthenticatedImplCopyWithImpl<_$AuthUnauthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) {
    return unauthenticated(user, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) {
    return unauthenticated?.call(user, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(user, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthUnauthenticated implements AuthState {
  const factory _AuthUnauthenticated({final User? user, final String? error}) =
      _$AuthUnauthenticatedImpl;

  @override
  User? get user;
  String? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUnauthenticatedImplCopyWith<_$AuthUnauthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthAuthenticatingImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthAuthenticatingImplCopyWith(_$AuthAuthenticatingImpl value,
          $Res Function(_$AuthAuthenticatingImpl) then) =
      __$$AuthAuthenticatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthAuthenticatingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatingImpl>
    implements _$$AuthAuthenticatingImplCopyWith<$Res> {
  __$$AuthAuthenticatingImplCopyWithImpl(_$AuthAuthenticatingImpl _value,
      $Res Function(_$AuthAuthenticatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthAuthenticatingImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthAuthenticatingImpl implements _AuthAuthenticating {
  const _$AuthAuthenticatingImpl({this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthState.authenticating(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatingImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatingImplCopyWith<_$AuthAuthenticatingImpl> get copyWith =>
      __$$AuthAuthenticatingImplCopyWithImpl<_$AuthAuthenticatingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) {
    return authenticating(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) {
    return authenticating?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class _AuthAuthenticating implements AuthState {
  const factory _AuthAuthenticating({final User? user}) =
      _$AuthAuthenticatingImpl;

  @override
  User? get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthAuthenticatingImplCopyWith<_$AuthAuthenticatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthAuthenticatedImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthAuthenticatedImplCopyWith(_$AuthAuthenticatedImpl value,
          $Res Function(_$AuthAuthenticatedImpl) then) =
      __$$AuthAuthenticatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatedImpl>
    implements _$$AuthAuthenticatedImplCopyWith<$Res> {
  __$$AuthAuthenticatedImplCopyWithImpl(_$AuthAuthenticatedImpl _value,
      $Res Function(_$AuthAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthAuthenticatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthAuthenticatedImpl implements _AuthAuthenticated {
  const _$AuthAuthenticatedImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      __$$AuthAuthenticatedImplCopyWithImpl<_$AuthAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthAuthenticated implements AuthState {
  const factory _AuthAuthenticated({required final User user}) =
      _$AuthAuthenticatedImpl;

  @override
  User get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$LoginErrorImplCopyWith(
          _$LoginErrorImpl value, $Res Function(_$LoginErrorImpl) then) =
      __$$LoginErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? error});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoginErrorImpl>
    implements _$$LoginErrorImplCopyWith<$Res> {
  __$$LoginErrorImplCopyWithImpl(
      _$LoginErrorImpl _value, $Res Function(_$LoginErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_$LoginErrorImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginErrorImpl implements _LoginError {
  const _$LoginErrorImpl({this.user, this.error});

  @override
  final User? user;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.loginError(user: $user, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorImplCopyWith<_$LoginErrorImpl> get copyWith =>
      __$$LoginErrorImplCopyWithImpl<_$LoginErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) {
    return loginError(user, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) {
    return loginError?.call(user, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) {
    if (loginError != null) {
      return loginError(user, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) {
    return loginError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) {
    return loginError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (loginError != null) {
      return loginError(this);
    }
    return orElse();
  }
}

abstract class _LoginError implements AuthState {
  const factory _LoginError({final User? user, final String? error}) =
      _$LoginErrorImpl;

  @override
  User? get user;
  String? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorImplCopyWith<_$LoginErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpErrorImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$SignUpErrorImplCopyWith(
          _$SignUpErrorImpl value, $Res Function(_$SignUpErrorImpl) then) =
      __$$SignUpErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? error});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SignUpErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignUpErrorImpl>
    implements _$$SignUpErrorImplCopyWith<$Res> {
  __$$SignUpErrorImplCopyWithImpl(
      _$SignUpErrorImpl _value, $Res Function(_$SignUpErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SignUpErrorImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignUpErrorImpl implements _SignUpError {
  const _$SignUpErrorImpl({this.user, this.error});

  @override
  final User? user;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.signUpError(user: $user, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpErrorImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpErrorImplCopyWith<_$SignUpErrorImpl> get copyWith =>
      __$$SignUpErrorImplCopyWithImpl<_$SignUpErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) {
    return signUpError(user, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) {
    return signUpError?.call(user, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) {
    if (signUpError != null) {
      return signUpError(user, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) {
    return signUpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) {
    return signUpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (signUpError != null) {
      return signUpError(this);
    }
    return orElse();
  }
}

abstract class _SignUpError implements AuthState {
  const factory _SignUpError({final User? user, final String? error}) =
      _$SignUpErrorImpl;

  @override
  User? get user;
  String? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpErrorImplCopyWith<_$SignUpErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignedOutImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthSignedOutImplCopyWith(
          _$AuthSignedOutImpl value, $Res Function(_$AuthSignedOutImpl) then) =
      __$$AuthSignedOutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? message});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthSignedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSignedOutImpl>
    implements _$$AuthSignedOutImplCopyWith<$Res> {
  __$$AuthSignedOutImplCopyWithImpl(
      _$AuthSignedOutImpl _value, $Res Function(_$AuthSignedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AuthSignedOutImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthSignedOutImpl implements _AuthSignedOut {
  const _$AuthSignedOutImpl({this.user, this.message});

  @override
  final User? user;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.authSignedOut(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignedOutImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignedOutImplCopyWith<_$AuthSignedOutImpl> get copyWith =>
      __$$AuthSignedOutImplCopyWithImpl<_$AuthSignedOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user, String? error) unauthenticated,
    required TResult Function(User? user) authenticating,
    required TResult Function(User user) authenticated,
    required TResult Function(User? user, String? error) loginError,
    required TResult Function(User? user, String? error) signUpError,
    required TResult Function(User? user, String? message) authSignedOut,
  }) {
    return authSignedOut(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user, String? error)? unauthenticated,
    TResult? Function(User? user)? authenticating,
    TResult? Function(User user)? authenticated,
    TResult? Function(User? user, String? error)? loginError,
    TResult? Function(User? user, String? error)? signUpError,
    TResult? Function(User? user, String? message)? authSignedOut,
  }) {
    return authSignedOut?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user, String? error)? unauthenticated,
    TResult Function(User? user)? authenticating,
    TResult Function(User user)? authenticated,
    TResult Function(User? user, String? error)? loginError,
    TResult Function(User? user, String? error)? signUpError,
    TResult Function(User? user, String? message)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authSignedOut != null) {
      return authSignedOut(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticating value) authenticating,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_LoginError value) loginError,
    required TResult Function(_SignUpError value) signUpError,
    required TResult Function(_AuthSignedOut value) authSignedOut,
  }) {
    return authSignedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_AuthAuthenticating value)? authenticating,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_LoginError value)? loginError,
    TResult? Function(_SignUpError value)? signUpError,
    TResult? Function(_AuthSignedOut value)? authSignedOut,
  }) {
    return authSignedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticating value)? authenticating,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_LoginError value)? loginError,
    TResult Function(_SignUpError value)? signUpError,
    TResult Function(_AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authSignedOut != null) {
      return authSignedOut(this);
    }
    return orElse();
  }
}

abstract class _AuthSignedOut implements AuthState {
  const factory _AuthSignedOut({final User? user, final String? message}) =
      _$AuthSignedOutImpl;

  @override
  User? get user;
  String? get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSignedOutImplCopyWith<_$AuthSignedOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
