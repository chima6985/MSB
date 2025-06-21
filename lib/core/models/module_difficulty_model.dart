import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_difficulty_model.freezed.dart';
part 'module_difficulty_model.g.dart';

@freezed
class ModuleDifficulty with _$ModuleDifficulty {
  const factory ModuleDifficulty({
    @Default('') String id,
    @Default('') String type,
    @Default('') String name,
  }) = _ModuleDifficulty;

  factory ModuleDifficulty.fromJson(Map<String, dynamic> json) =>
      _$ModuleDifficultyFromJson(json);
}
