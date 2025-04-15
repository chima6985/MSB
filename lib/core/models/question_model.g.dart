// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as String? ?? '',
      question: json['question'] as String? ?? '',
      translateQuestion: json['translate_question'] as String? ?? '',
      suffix: json['suffix'] as String? ?? '',
      audioPath: json['audio_path'] as String? ?? '',
      imagePath: json['image_path'] as String? ?? '',
      timeLimit: (json['time_limit'] as num?)?.toInt() ?? 0,
      shuffleAnswers: json['shuffleAnswers'] as bool? ?? false,
      correctAnswer: json['correctAnswer'] as String? ?? '',
      answer: (json['answer'] as List<dynamic>?)
              ?.map((e) => AnswerFormat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AnswerFormat>[],
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'translate_question': instance.translateQuestion,
      'suffix': instance.suffix,
      'audio_path': instance.audioPath,
      'image_path': instance.imagePath,
      'time_limit': instance.timeLimit,
      'shuffleAnswers': instance.shuffleAnswers,
      'correctAnswer': instance.correctAnswer,
      'answer': instance.answer,
    };

_$AnswerFormatImpl _$$AnswerFormatImplFromJson(Map<String, dynamic> json) =>
    _$AnswerFormatImpl(
      answer: Answer.fromJson(json['answer'] as Map<String, dynamic>),
      format: json['format'] as String? ?? '',
    );

Map<String, dynamic> _$$AnswerFormatImplToJson(_$AnswerFormatImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'format': instance.format,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      value: json['value'] as String? ?? '',
      file: json['file'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Option>[],
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'file': instance.file,
      'options': instance.options,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
