// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_difficulty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModuleDifficulty _$ModuleDifficultyFromJson(Map<String, dynamic> json) {
  return _ModuleDifficulty.fromJson(json);
}

/// @nodoc
mixin _$ModuleDifficulty {
  List<Difficulty> get difficulty => throw _privateConstructorUsedError;
  List<Module> get modules => throw _privateConstructorUsedError;

  /// Serializes this ModuleDifficulty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModuleDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleDifficultyCopyWith<ModuleDifficulty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleDifficultyCopyWith<$Res> {
  factory $ModuleDifficultyCopyWith(
          ModuleDifficulty value, $Res Function(ModuleDifficulty) then) =
      _$ModuleDifficultyCopyWithImpl<$Res, ModuleDifficulty>;
  @useResult
  $Res call({List<Difficulty> difficulty, List<Module> modules});
}

/// @nodoc
class _$ModuleDifficultyCopyWithImpl<$Res, $Val extends ModuleDifficulty>
    implements $ModuleDifficultyCopyWith<$Res> {
  _$ModuleDifficultyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModuleDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? modules = null,
  }) {
    return _then(_value.copyWith(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as List<Difficulty>,
      modules: null == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModuleDifficultyImplCopyWith<$Res>
    implements $ModuleDifficultyCopyWith<$Res> {
  factory _$$ModuleDifficultyImplCopyWith(_$ModuleDifficultyImpl value,
          $Res Function(_$ModuleDifficultyImpl) then) =
      __$$ModuleDifficultyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Difficulty> difficulty, List<Module> modules});
}

/// @nodoc
class __$$ModuleDifficultyImplCopyWithImpl<$Res>
    extends _$ModuleDifficultyCopyWithImpl<$Res, _$ModuleDifficultyImpl>
    implements _$$ModuleDifficultyImplCopyWith<$Res> {
  __$$ModuleDifficultyImplCopyWithImpl(_$ModuleDifficultyImpl _value,
      $Res Function(_$ModuleDifficultyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModuleDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? modules = null,
  }) {
    return _then(_$ModuleDifficultyImpl(
      difficulty: null == difficulty
          ? _value._difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as List<Difficulty>,
      modules: null == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleDifficultyImpl implements _ModuleDifficulty {
  const _$ModuleDifficultyImpl(
      {final List<Difficulty> difficulty = const <Difficulty>[],
      final List<Module> modules = const <Module>[]})
      : _difficulty = difficulty,
        _modules = modules;

  factory _$ModuleDifficultyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleDifficultyImplFromJson(json);

  final List<Difficulty> _difficulty;
  @override
  @JsonKey()
  List<Difficulty> get difficulty {
    if (_difficulty is EqualUnmodifiableListView) return _difficulty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_difficulty);
  }

  final List<Module> _modules;
  @override
  @JsonKey()
  List<Module> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  @override
  String toString() {
    return 'ModuleDifficulty(difficulty: $difficulty, modules: $modules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleDifficultyImpl &&
            const DeepCollectionEquality()
                .equals(other._difficulty, _difficulty) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_difficulty),
      const DeepCollectionEquality().hash(_modules));

  /// Create a copy of ModuleDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleDifficultyImplCopyWith<_$ModuleDifficultyImpl> get copyWith =>
      __$$ModuleDifficultyImplCopyWithImpl<_$ModuleDifficultyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleDifficultyImplToJson(
      this,
    );
  }
}

abstract class _ModuleDifficulty implements ModuleDifficulty {
  const factory _ModuleDifficulty(
      {final List<Difficulty> difficulty,
      final List<Module> modules}) = _$ModuleDifficultyImpl;

  factory _ModuleDifficulty.fromJson(Map<String, dynamic> json) =
      _$ModuleDifficultyImpl.fromJson;

  @override
  List<Difficulty> get difficulty;
  @override
  List<Module> get modules;

  /// Create a copy of ModuleDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleDifficultyImplCopyWith<_$ModuleDifficultyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Difficulty _$DifficultyFromJson(Map<String, dynamic> json) {
  return _Difficulty.fromJson(json);
}

/// @nodoc
mixin _$Difficulty {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Difficulty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Difficulty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DifficultyCopyWith<Difficulty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DifficultyCopyWith<$Res> {
  factory $DifficultyCopyWith(
          Difficulty value, $Res Function(Difficulty) then) =
      _$DifficultyCopyWithImpl<$Res, Difficulty>;
  @useResult
  $Res call({String id, String type, String name});
}

/// @nodoc
class _$DifficultyCopyWithImpl<$Res, $Val extends Difficulty>
    implements $DifficultyCopyWith<$Res> {
  _$DifficultyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Difficulty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DifficultyImplCopyWith<$Res>
    implements $DifficultyCopyWith<$Res> {
  factory _$$DifficultyImplCopyWith(
          _$DifficultyImpl value, $Res Function(_$DifficultyImpl) then) =
      __$$DifficultyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String name});
}

/// @nodoc
class __$$DifficultyImplCopyWithImpl<$Res>
    extends _$DifficultyCopyWithImpl<$Res, _$DifficultyImpl>
    implements _$$DifficultyImplCopyWith<$Res> {
  __$$DifficultyImplCopyWithImpl(
      _$DifficultyImpl _value, $Res Function(_$DifficultyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Difficulty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_$DifficultyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DifficultyImpl implements _Difficulty {
  const _$DifficultyImpl({this.id = '', this.type = '', this.name = ''});

  factory _$DifficultyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DifficultyImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'Difficulty(id: $id, type: $type, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DifficultyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  /// Create a copy of Difficulty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DifficultyImplCopyWith<_$DifficultyImpl> get copyWith =>
      __$$DifficultyImplCopyWithImpl<_$DifficultyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DifficultyImplToJson(
      this,
    );
  }
}

abstract class _Difficulty implements Difficulty {
  const factory _Difficulty(
      {final String id,
      final String type,
      final String name}) = _$DifficultyImpl;

  factory _Difficulty.fromJson(Map<String, dynamic> json) =
      _$DifficultyImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get name;

  /// Create a copy of Difficulty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DifficultyImplCopyWith<_$DifficultyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return _Module.fromJson(json);
}

/// @nodoc
mixin _$Module {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'module_title')
  String get moduleTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'module_description')
  String get moduleDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Module to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleCopyWith<Module> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleCopyWith<$Res> {
  factory $ModuleCopyWith(Module value, $Res Function(Module) then) =
      _$ModuleCopyWithImpl<$Res, Module>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'module_title') String moduleTitle,
      @JsonKey(name: 'module_description') String moduleDescription,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$ModuleCopyWithImpl<$Res, $Val extends Module>
    implements $ModuleCopyWith<$Res> {
  _$ModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? moduleTitle = null,
    Object? moduleDescription = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      moduleTitle: null == moduleTitle
          ? _value.moduleTitle
          : moduleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      moduleDescription: null == moduleDescription
          ? _value.moduleDescription
          : moduleDescription // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModuleImplCopyWith<$Res> implements $ModuleCopyWith<$Res> {
  factory _$$ModuleImplCopyWith(
          _$ModuleImpl value, $Res Function(_$ModuleImpl) then) =
      __$$ModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'module_title') String moduleTitle,
      @JsonKey(name: 'module_description') String moduleDescription,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$$ModuleImplCopyWithImpl<$Res>
    extends _$ModuleCopyWithImpl<$Res, _$ModuleImpl>
    implements _$$ModuleImplCopyWith<$Res> {
  __$$ModuleImplCopyWithImpl(
      _$ModuleImpl _value, $Res Function(_$ModuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? moduleTitle = null,
    Object? moduleDescription = null,
    Object? imageUrl = null,
  }) {
    return _then(_$ModuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      moduleTitle: null == moduleTitle
          ? _value.moduleTitle
          : moduleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      moduleDescription: null == moduleDescription
          ? _value.moduleDescription
          : moduleDescription // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleImpl implements _Module {
  const _$ModuleImpl(
      {this.id = '',
      @JsonKey(name: 'module_title') this.moduleTitle = '',
      @JsonKey(name: 'module_description') this.moduleDescription = '',
      @JsonKey(name: 'image_url') this.imageUrl = ''});

  factory _$ModuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'module_title')
  final String moduleTitle;
  @override
  @JsonKey(name: 'module_description')
  final String moduleDescription;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'Module(id: $id, moduleTitle: $moduleTitle, moduleDescription: $moduleDescription, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moduleTitle, moduleTitle) ||
                other.moduleTitle == moduleTitle) &&
            (identical(other.moduleDescription, moduleDescription) ||
                other.moduleDescription == moduleDescription) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, moduleTitle, moduleDescription, imageUrl);

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleImplCopyWith<_$ModuleImpl> get copyWith =>
      __$$ModuleImplCopyWithImpl<_$ModuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleImplToJson(
      this,
    );
  }
}

abstract class _Module implements Module {
  const factory _Module(
      {final String id,
      @JsonKey(name: 'module_title') final String moduleTitle,
      @JsonKey(name: 'module_description') final String moduleDescription,
      @JsonKey(name: 'image_url') final String imageUrl}) = _$ModuleImpl;

  factory _Module.fromJson(Map<String, dynamic> json) = _$ModuleImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'module_title')
  String get moduleTitle;
  @override
  @JsonKey(name: 'module_description')
  String get moduleDescription;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleImplCopyWith<_$ModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
