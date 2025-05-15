import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    @JsonKey(name: 'game_player_id') @Default('') String section,
    @JsonKey(name: 'user_id') @Default('') String difficulty,
    @Default('') String username,
    @JsonKey(name: 'is_game_master') @Default(false) bool isGameMaster,
    @JsonKey(name: 'is_team_leader') @Default(false) bool isTeamLeader,
    @JsonKey(name: 'image_url') @Default('') String? imageUrl,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
