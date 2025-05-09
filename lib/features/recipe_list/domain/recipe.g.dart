// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: json['id'] as String,
  title: json['title'] as String,
  waterAmount: (json['waterAmount'] as num?)?.toDouble(),
  coffeeAmount: (json['coffeeAmount'] as num?)?.toDouble(),
  temperature: (json['temperature'] as num?)?.toDouble(),
  grain: json['grain'] as String?,
  steps: (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'waterAmount': instance.waterAmount,
  'coffeeAmount': instance.coffeeAmount,
  'temperature': instance.temperature,
  'grain': instance.grain,
  'steps': instance.steps,
};
