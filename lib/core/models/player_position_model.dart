import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_position_model.freezed.dart';
part 'player_position_model.g.dart';

@freezed
class PlayerPosition with _$PlayerPosition {
  const factory PlayerPosition({
    @Default('') String userId,
    @Default('') String username,
    @Default(0) int points,
    @Default(0) int coins,
    @Default(0) int position,
  }) = _PlayerPosition;

  factory PlayerPosition.fromJson(Map<String, dynamic> json) =>
      _$PlayerPositionFromJson(json);
}
