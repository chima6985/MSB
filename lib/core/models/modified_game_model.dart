import 'package:freezed_annotation/freezed_annotation.dart';

part 'modified_game_model.freezed.dart';
part 'modified_game_model.g.dart';

@freezed
class ModifiedGame with _$ModifiedGame {
  const factory ModifiedGame({
    @JsonKey(name: 'team_mode') @Default(false) bool teamMode,
    @JsonKey(name: 'team_formation') @Default(null) bool? teamFormation,
  }) = _ModifiedGame;

  factory ModifiedGame.fromJson(Map<String, dynamic> json) =>
      _$ModifiedGameFromJson(json);
}
