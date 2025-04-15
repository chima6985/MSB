// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'translate_question')
  String get translateQuestion => throw _privateConstructorUsedError;
  String get suffix => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_path')
  String get audioPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_limit')
  int get timeLimit => throw _privateConstructorUsedError;
  bool get shuffleAnswers =>
      throw _privateConstructorUsedError; // required dynamic options,
  String get correctAnswer => throw _privateConstructorUsedError;
  List<AnswerFormat>? get answer => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String id,
      String question,
      @JsonKey(name: 'translate_question') String translateQuestion,
      String suffix,
      @JsonKey(name: 'audio_path') String audioPath,
      @JsonKey(name: 'image_path') String imagePath,
      @JsonKey(name: 'time_limit') int timeLimit,
      bool shuffleAnswers,
      String correctAnswer,
      List<AnswerFormat>? answer});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? translateQuestion = null,
    Object? suffix = null,
    Object? audioPath = null,
    Object? imagePath = null,
    Object? timeLimit = null,
    Object? shuffleAnswers = null,
    Object? correctAnswer = null,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      translateQuestion: null == translateQuestion
          ? _value.translateQuestion
          : translateQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      shuffleAnswers: null == shuffleAnswers
          ? _value.shuffleAnswers
          : shuffleAnswers // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<AnswerFormat>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      @JsonKey(name: 'translate_question') String translateQuestion,
      String suffix,
      @JsonKey(name: 'audio_path') String audioPath,
      @JsonKey(name: 'image_path') String imagePath,
      @JsonKey(name: 'time_limit') int timeLimit,
      bool shuffleAnswers,
      String correctAnswer,
      List<AnswerFormat>? answer});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? translateQuestion = null,
    Object? suffix = null,
    Object? audioPath = null,
    Object? imagePath = null,
    Object? timeLimit = null,
    Object? shuffleAnswers = null,
    Object? correctAnswer = null,
    Object? answer = freezed,
  }) {
    return _then(_$QuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      translateQuestion: null == translateQuestion
          ? _value.translateQuestion
          : translateQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      shuffleAnswers: null == shuffleAnswers
          ? _value.shuffleAnswers
          : shuffleAnswers // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<AnswerFormat>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {this.id = '',
      this.question = '',
      @JsonKey(name: 'translate_question') this.translateQuestion = '',
      this.suffix = '',
      @JsonKey(name: 'audio_path') this.audioPath = '',
      @JsonKey(name: 'image_path') this.imagePath = '',
      @JsonKey(name: 'time_limit') this.timeLimit = 0,
      this.shuffleAnswers = false,
      this.correctAnswer = '',
      final List<AnswerFormat>? answer = const <AnswerFormat>[]})
      : _answer = answer;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String question;
  @override
  @JsonKey(name: 'translate_question')
  final String translateQuestion;
  @override
  @JsonKey()
  final String suffix;
  @override
  @JsonKey(name: 'audio_path')
  final String audioPath;
  @override
  @JsonKey(name: 'image_path')
  final String imagePath;
  @override
  @JsonKey(name: 'time_limit')
  final int timeLimit;
  @override
  @JsonKey()
  final bool shuffleAnswers;
// required dynamic options,
  @override
  @JsonKey()
  final String correctAnswer;
  final List<AnswerFormat>? _answer;
  @override
  @JsonKey()
  List<AnswerFormat>? get answer {
    final value = _answer;
    if (value == null) return null;
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Question(id: $id, question: $question, translateQuestion: $translateQuestion, suffix: $suffix, audioPath: $audioPath, imagePath: $imagePath, timeLimit: $timeLimit, shuffleAnswers: $shuffleAnswers, correctAnswer: $correctAnswer, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.translateQuestion, translateQuestion) ||
                other.translateQuestion == translateQuestion) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.audioPath, audioPath) ||
                other.audioPath == audioPath) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.shuffleAnswers, shuffleAnswers) ||
                other.shuffleAnswers == shuffleAnswers) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            const DeepCollectionEquality().equals(other._answer, _answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      translateQuestion,
      suffix,
      audioPath,
      imagePath,
      timeLimit,
      shuffleAnswers,
      correctAnswer,
      const DeepCollectionEquality().hash(_answer));

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {final String id,
      final String question,
      @JsonKey(name: 'translate_question') final String translateQuestion,
      final String suffix,
      @JsonKey(name: 'audio_path') final String audioPath,
      @JsonKey(name: 'image_path') final String imagePath,
      @JsonKey(name: 'time_limit') final int timeLimit,
      final bool shuffleAnswers,
      final String correctAnswer,
      final List<AnswerFormat>? answer}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  @JsonKey(name: 'translate_question')
  String get translateQuestion;
  @override
  String get suffix;
  @override
  @JsonKey(name: 'audio_path')
  String get audioPath;
  @override
  @JsonKey(name: 'image_path')
  String get imagePath;
  @override
  @JsonKey(name: 'time_limit')
  int get timeLimit;
  @override
  bool get shuffleAnswers; // required dynamic options,
  @override
  String get correctAnswer;
  @override
  List<AnswerFormat>? get answer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerFormat _$AnswerFormatFromJson(Map<String, dynamic> json) {
  return _AnswerFormat.fromJson(json);
}

/// @nodoc
mixin _$AnswerFormat {
  Answer get answer => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;

  /// Serializes this AnswerFormat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerFormat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerFormatCopyWith<AnswerFormat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerFormatCopyWith<$Res> {
  factory $AnswerFormatCopyWith(
          AnswerFormat value, $Res Function(AnswerFormat) then) =
      _$AnswerFormatCopyWithImpl<$Res, AnswerFormat>;
  @useResult
  $Res call({Answer answer, String format});

  $AnswerCopyWith<$Res> get answer;
}

/// @nodoc
class _$AnswerFormatCopyWithImpl<$Res, $Val extends AnswerFormat>
    implements $AnswerFormatCopyWith<$Res> {
  _$AnswerFormatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerFormat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? format = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AnswerFormat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res> get answer {
    return $AnswerCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnswerFormatImplCopyWith<$Res>
    implements $AnswerFormatCopyWith<$Res> {
  factory _$$AnswerFormatImplCopyWith(
          _$AnswerFormatImpl value, $Res Function(_$AnswerFormatImpl) then) =
      __$$AnswerFormatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Answer answer, String format});

  @override
  $AnswerCopyWith<$Res> get answer;
}

/// @nodoc
class __$$AnswerFormatImplCopyWithImpl<$Res>
    extends _$AnswerFormatCopyWithImpl<$Res, _$AnswerFormatImpl>
    implements _$$AnswerFormatImplCopyWith<$Res> {
  __$$AnswerFormatImplCopyWithImpl(
      _$AnswerFormatImpl _value, $Res Function(_$AnswerFormatImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerFormat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? format = null,
  }) {
    return _then(_$AnswerFormatImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerFormatImpl implements _AnswerFormat {
  const _$AnswerFormatImpl({required this.answer, this.format = ''});

  factory _$AnswerFormatImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerFormatImplFromJson(json);

  @override
  final Answer answer;
  @override
  @JsonKey()
  final String format;

  @override
  String toString() {
    return 'AnswerFormat(answer: $answer, format: $format)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerFormatImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer, format);

  /// Create a copy of AnswerFormat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerFormatImplCopyWith<_$AnswerFormatImpl> get copyWith =>
      __$$AnswerFormatImplCopyWithImpl<_$AnswerFormatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerFormatImplToJson(
      this,
    );
  }
}

abstract class _AnswerFormat implements AnswerFormat {
  const factory _AnswerFormat(
      {required final Answer answer, final String format}) = _$AnswerFormatImpl;

  factory _AnswerFormat.fromJson(Map<String, dynamic> json) =
      _$AnswerFormatImpl.fromJson;

  @override
  Answer get answer;
  @override
  String get format;

  /// Create a copy of AnswerFormat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerFormatImplCopyWith<_$AnswerFormatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String? get value => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  List<Option>? get options => throw _privateConstructorUsedError;

  /// Serializes this Answer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({String? value, String? file, List<Option>? options});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? file = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value, String? file, List<Option>? options});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? file = freezed,
    Object? options = freezed,
  }) {
    return _then(_$AnswerImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {this.value = '',
      this.file = '',
      final List<Option>? options = const <Option>[]})
      : _options = options;

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey()
  final String? value;
  @override
  @JsonKey()
  final String? file;
  final List<Option>? _options;
  @override
  @JsonKey()
  List<Option>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Answer(value: $value, file: $file, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, value, file, const DeepCollectionEquality().hash(_options));

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {final String? value,
      final String? file,
      final List<Option>? options}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  String? get value;
  @override
  String? get file;
  @override
  List<Option>? get options;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
          _$OptionImpl value, $Res Function(_$OptionImpl) then) =
      __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
      _$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$OptionImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionImpl implements _Option {
  const _$OptionImpl({this.label = '', this.value = ''});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'Option(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionImplToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  const factory _Option({final String label, final String value}) =
      _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  String get label;
  @override
  String get value;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
