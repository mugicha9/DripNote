// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_process_step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeProcessStepAdapter extends TypeAdapter<RecipeProcessStep> {
  @override
  final int typeId = 2;

  @override
  RecipeProcessStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeProcessStep(
      id: fields[0] as String,
      type: fields[1] as RecipeProcessType,
      value: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeProcessStep obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeProcessStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeProcessStepImpl _$$RecipeProcessStepImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeProcessStepImpl(
      id: json['id'] as String,
      type: $enumDecode(_$RecipeProcessTypeEnumMap, json['type']),
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$RecipeProcessStepImplToJson(
        _$RecipeProcessStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RecipeProcessTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$RecipeProcessTypeEnumMap = {
  RecipeProcessType.pour: 'pour',
  RecipeProcessType.wait: 'wait',
  RecipeProcessType.stir: 'stir',
};
