import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_details_model.freezed.dart';
part 'game_details_model.g.dart';

@freezed
class GameDetails with _$GameDetails {
  const factory GameDetails({
    @Default('') String section,
    @Default('') String difficulty,
    @JsonKey(name: 'team_mode') @Default(false) bool teamMode,
  }) = _GameDetails;

  factory GameDetails.fromJson(Map<String, dynamic> json) =>
      _$GameDetailsFromJson(json);
}
