import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_response_model.freezed.dart';
part 'answer_response_model.g.dart';

@freezed
class AnswerResponse with _$AnswerResponse {
  const factory AnswerResponse({
    @Default('') String message,
    @Default(0) int accuracy,
    @JsonKey(name: 'coins_earned') @Default(0) int coinsEarned,
    @JsonKey(name: 'total_lives') @Default(0) int totalLives,
    @Default('') String timeSpent,
  }) = _AnswerResponse;

  factory AnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerResponseFromJson(json);
}
