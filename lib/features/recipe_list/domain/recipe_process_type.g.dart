// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_process_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeProcessTypeAdapter extends TypeAdapter<RecipeProcessType> {
  @override
  final int typeId = 1;

  @override
  RecipeProcessType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RecipeProcessType.pour;
      case 1:
        return RecipeProcessType.wait;
      case 2:
        return RecipeProcessType.stir;
      default:
        return RecipeProcessType.pour;
    }
  }

  @override
  void write(BinaryWriter writer, RecipeProcessType obj) {
    switch (obj) {
      case RecipeProcessType.pour:
        writer.writeByte(0);
        break;
      case RecipeProcessType.wait:
        writer.writeByte(1);
        break;
      case RecipeProcessType.stir:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeProcessTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
