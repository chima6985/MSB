import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_difficulty_model.freezed.dart';
part 'module_difficulty_model.g.dart';

@freezed
class ModuleDifficulty with _$ModuleDifficulty {
  const factory ModuleDifficulty({
    @Default(<Difficulty>[]) List<Difficulty> difficulty,
    @Default(<Module>[]) List<Module> modules,
  }) = _ModuleDifficulty;

  factory ModuleDifficulty.fromJson(Map<String, dynamic> json) =>
      _$ModuleDifficultyFromJson(json);
}

@freezed
class Difficulty with _$Difficulty {
  const factory Difficulty({
    @Default('') String id,
    @Default('') String type,
    @Default('') String name,
  }) = _Difficulty;

  factory Difficulty.fromJson(Map<String, dynamic> json) =>
      _$DifficultyFromJson(json);
}

@freezed
class Module with _$Module {
  const factory Module({
    @Default('') String id,
    @JsonKey(name: 'module_title') @Default('') String moduleTitle,
    @JsonKey(name: 'module_description') @Default('') String moduleDescription,
    @JsonKey(name: 'image_url') @Default('') String imageUrl,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}
