// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_difficulty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SectionDifficulty _$SectionDifficultyFromJson(Map<String, dynamic> json) {
  return _SectionDifficulty.fromJson(json);
}

/// @nodoc
mixin _$SectionDifficulty {
  List<Section> get sections => throw _privateConstructorUsedError;
  List<Difficulty> get difficulties => throw _privateConstructorUsedError;

  /// Serializes this SectionDifficulty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SectionDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionDifficultyCopyWith<SectionDifficulty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionDifficultyCopyWith<$Res> {
  factory $SectionDifficultyCopyWith(
          SectionDifficulty value, $Res Function(SectionDifficulty) then) =
      _$SectionDifficultyCopyWithImpl<$Res, SectionDifficulty>;
  @useResult
  $Res call({List<Section> sections, List<Difficulty> difficulties});
}

/// @nodoc
class _$SectionDifficultyCopyWithImpl<$Res, $Val extends SectionDifficulty>
    implements $SectionDifficultyCopyWith<$Res> {
  _$SectionDifficultyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SectionDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? difficulties = null,
  }) {
    return _then(_value.copyWith(
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      difficulties: null == difficulties
          ? _value.difficulties
          : difficulties // ignore: cast_nullable_to_non_nullable
              as List<Difficulty>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SectionDifficultyImplCopyWith<$Res>
    implements $SectionDifficultyCopyWith<$Res> {
  factory _$$SectionDifficultyImplCopyWith(_$SectionDifficultyImpl value,
          $Res Function(_$SectionDifficultyImpl) then) =
      __$$SectionDifficultyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Section> sections, List<Difficulty> difficulties});
}

/// @nodoc
class __$$SectionDifficultyImplCopyWithImpl<$Res>
    extends _$SectionDifficultyCopyWithImpl<$Res, _$SectionDifficultyImpl>
    implements _$$SectionDifficultyImplCopyWith<$Res> {
  __$$SectionDifficultyImplCopyWithImpl(_$SectionDifficultyImpl _value,
      $Res Function(_$SectionDifficultyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SectionDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? difficulties = null,
  }) {
    return _then(_$SectionDifficultyImpl(
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      difficulties: null == difficulties
          ? _value._difficulties
          : difficulties // ignore: cast_nullable_to_non_nullable
              as List<Difficulty>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SectionDifficultyImpl implements _SectionDifficulty {
  const _$SectionDifficultyImpl(
      {final List<Section> sections = const <Section>[],
      final List<Difficulty> difficulties = const <Difficulty>[]})
      : _sections = sections,
        _difficulties = difficulties;

  factory _$SectionDifficultyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionDifficultyImplFromJson(json);

  final List<Section> _sections;
  @override
  @JsonKey()
  List<Section> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  final List<Difficulty> _difficulties;
  @override
  @JsonKey()
  List<Difficulty> get difficulties {
    if (_difficulties is EqualUnmodifiableListView) return _difficulties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_difficulties);
  }

  @override
  String toString() {
    return 'SectionDifficulty(sections: $sections, difficulties: $difficulties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionDifficultyImpl &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality()
                .equals(other._difficulties, _difficulties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_difficulties));

  /// Create a copy of SectionDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionDifficultyImplCopyWith<_$SectionDifficultyImpl> get copyWith =>
      __$$SectionDifficultyImplCopyWithImpl<_$SectionDifficultyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionDifficultyImplToJson(
      this,
    );
  }
}

abstract class _SectionDifficulty implements SectionDifficulty {
  const factory _SectionDifficulty(
      {final List<Section> sections,
      final List<Difficulty> difficulties}) = _$SectionDifficultyImpl;

  factory _SectionDifficulty.fromJson(Map<String, dynamic> json) =
      _$SectionDifficultyImpl.fromJson;

  @override
  List<Section> get sections;
  @override
  List<Difficulty> get difficulties;

  /// Create a copy of SectionDifficulty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionDifficultyImplCopyWith<_$SectionDifficultyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Section _$SectionFromJson(Map<String, dynamic> json) {
  return _Section.fromJson(json);
}

/// @nodoc
mixin _$Section {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'section_name')
  String get sectionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'yoruba_section_name')
  String get yorubaSectionName => throw _privateConstructorUsedError;

  /// Serializes this Section to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionCopyWith<Section> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionCopyWith<$Res> {
  factory $SectionCopyWith(Section value, $Res Function(Section) then) =
      _$SectionCopyWithImpl<$Res, Section>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'section_name') String sectionName,
      @JsonKey(name: 'yoruba_section_name') String yorubaSectionName});
}

/// @nodoc
class _$SectionCopyWithImpl<$Res, $Val extends Section>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sectionName = null,
    Object? yorubaSectionName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      yorubaSectionName: null == yorubaSectionName
          ? _value.yorubaSectionName
          : yorubaSectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SectionImplCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$$SectionImplCopyWith(
          _$SectionImpl value, $Res Function(_$SectionImpl) then) =
      __$$SectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'section_name') String sectionName,
      @JsonKey(name: 'yoruba_section_name') String yorubaSectionName});
}

/// @nodoc
class __$$SectionImplCopyWithImpl<$Res>
    extends _$SectionCopyWithImpl<$Res, _$SectionImpl>
    implements _$$SectionImplCopyWith<$Res> {
  __$$SectionImplCopyWithImpl(
      _$SectionImpl _value, $Res Function(_$SectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sectionName = null,
    Object? yorubaSectionName = null,
  }) {
    return _then(_$SectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      yorubaSectionName: null == yorubaSectionName
          ? _value.yorubaSectionName
          : yorubaSectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SectionImpl implements _Section {
  const _$SectionImpl(
      {this.id = '',
      @JsonKey(name: 'section_name') this.sectionName = '',
      @JsonKey(name: 'yoruba_section_name') this.yorubaSectionName = ''});

  factory _$SectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'section_name')
  final String sectionName;
  @override
  @JsonKey(name: 'yoruba_section_name')
  final String yorubaSectionName;

  @override
  String toString() {
    return 'Section(id: $id, sectionName: $sectionName, yorubaSectionName: $yorubaSectionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.yorubaSectionName, yorubaSectionName) ||
                other.yorubaSectionName == yorubaSectionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sectionName, yorubaSectionName);

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      __$$SectionImplCopyWithImpl<_$SectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionImplToJson(
      this,
    );
  }
}

abstract class _Section implements Section {
  const factory _Section(
      {final String id,
      @JsonKey(name: 'section_name') final String sectionName,
      @JsonKey(name: 'yoruba_section_name')
      final String yorubaSectionName}) = _$SectionImpl;

  factory _Section.fromJson(Map<String, dynamic> json) = _$SectionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'section_name')
  String get sectionName;
  @override
  @JsonKey(name: 'yoruba_section_name')
  String get yorubaSectionName;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
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
