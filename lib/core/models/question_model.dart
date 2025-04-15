import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    @Default('') String id,
    @Default('') String question,
    @JsonKey(name: 'translate_question') @Default('') String translateQuestion,
    @Default('') String suffix,
    @JsonKey(name: 'audio_path') @Default('') String audioPath,
    @JsonKey(name: 'image_path') @Default('') String imagePath,
    @JsonKey(name: 'time_limit') @Default(0) int timeLimit,
    @Default(false) bool shuffleAnswers,
    // required dynamic options,
    @Default('') String correctAnswer,
    @Default(<AnswerFormat>[]) List<AnswerFormat>? answer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class AnswerFormat with _$AnswerFormat {
  const factory AnswerFormat({
    required Answer answer,
    @Default('') String format,
  }) = _AnswerFormat;

  factory AnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$AnswerFormatFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    @Default('') String? value,
    @Default('') String? file,
    @Default(<Option>[]) List<Option>? options,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    @Default('') String label,
    @Default('') String value,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
