import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_stat_model.freezed.dart';
part 'player_stat_model.g.dart';

@freezed
class PlayerStat with _$PlayerStat {
  const factory PlayerStat({
    @Default('') String message,
    @Default(0) int accuracy,
    @Default(0) int coins,
    @Default('') String timeSpent,
  }) = _PlayerStat;

  factory PlayerStat.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatFromJson(json);
}
