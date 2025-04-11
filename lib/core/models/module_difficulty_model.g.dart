// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_difficulty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleDifficultyImpl _$$ModuleDifficultyImplFromJson(
        Map<String, dynamic> json) =>
    _$ModuleDifficultyImpl(
      difficulty: (json['difficulty'] as List<dynamic>?)
              ?.map((e) => Difficulty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Difficulty>[],
      modules: (json['modules'] as List<dynamic>?)
              ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Module>[],
    );

Map<String, dynamic> _$$ModuleDifficultyImplToJson(
        _$ModuleDifficultyImpl instance) =>
    <String, dynamic>{
      'difficulty': instance.difficulty,
      'modules': instance.modules,
    };

_$DifficultyImpl _$$DifficultyImplFromJson(Map<String, dynamic> json) =>
    _$DifficultyImpl(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$DifficultyImplToJson(_$DifficultyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
    };

_$ModuleImpl _$$ModuleImplFromJson(Map<String, dynamic> json) => _$ModuleImpl(
      id: json['id'] as String? ?? '',
      moduleTitle: json['module_title'] as String? ?? '',
      moduleDescription: json['module_description'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
    );

Map<String, dynamic> _$$ModuleImplToJson(_$ModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'module_title': instance.moduleTitle,
      'module_description': instance.moduleDescription,
      'image_url': instance.imageUrl,
    };
