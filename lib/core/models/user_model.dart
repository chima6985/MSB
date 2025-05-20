import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    @JsonKey(name: 'access_token') @Default('') String token,
    @Default('') String email,
    @Default('') String username,
    @Default('') String gender,
    @Default('') String image,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
    @JsonKey(name: 'is_survey_completed')
    @Default(false)
    bool isSurveyCompleted,
    @JsonKey(name: 'total_coins') @Default(0) int totalCoins,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
