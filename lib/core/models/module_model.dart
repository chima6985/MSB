import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_model.freezed.dart';
part 'module_model.g.dart';

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
