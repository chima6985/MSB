import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_difficulty_model.freezed.dart';
part 'section_difficulty_model.g.dart';

@freezed
class SectionDifficulty with _$SectionDifficulty {
  const factory SectionDifficulty({
    @Default(<Section>[]) List<Section> sections,
    @Default(<Difficulty>[]) List<Difficulty> difficulties,

  }) = _SectionDifficulty;

  factory SectionDifficulty.fromJson(Map<String, dynamic> json) =>
      _$SectionDifficultyFromJson(json);
}

@freezed
class Section with _$Section {
  const factory Section({
    @Default('') String id,
    @JsonKey(name: 'section_name') @Default('') String sectionName,
    @JsonKey(name: 'yoruba_section_name') @Default('') String yorubaSectionName,
  }) = _Section;

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);
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
