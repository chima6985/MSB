import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    @JsonKey(name: 'game_player_id') @Default('') String section,
    @JsonKey(name: 'user_id') @Default('') String difficulty,
    @Default('') String username,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
