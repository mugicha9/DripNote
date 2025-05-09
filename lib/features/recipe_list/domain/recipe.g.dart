// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: fields[0] as String,
      title: fields[1] as String,
      waterAmount: fields[2] as int?,
      coffeeAmount: fields[3] as int?,
      temperature: fields[4] as int?,
      grain: fields[5] as String?,
      steps: (fields[6] as List?)?.cast<RecipeProcessStep>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.waterAmount)
      ..writeByte(3)
      ..write(obj.coffeeAmount)
      ..writeByte(4)
      ..write(obj.temperature)
      ..writeByte(5)
      ..write(obj.grain)
      ..writeByte(6)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      waterAmount: (json['waterAmount'] as num?)?.toInt(),
      coffeeAmount: (json['coffeeAmount'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toInt(),
      grain: json['grain'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => RecipeProcessStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'waterAmount': instance.waterAmount,
      'coffeeAmount': instance.coffeeAmount,
      'temperature': instance.temperature,
      'grain': instance.grain,
      'steps': instance.steps,
    };
