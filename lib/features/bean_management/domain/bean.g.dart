// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BeanAdapter extends TypeAdapter<Bean> {
  @override
  final int typeId = 3;

  @override
  Bean read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bean(
      id: fields[0] as String,
      name: fields[1] as String,
      quantity: fields[2] as int,
      roastLevel: fields[3] as String,
      roastingDate: fields[4] as DateTime?,
      origin: fields[5] as String?,
      notes: fields[6] as String?,
      imageUrl: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Bean obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.roastLevel)
      ..writeByte(4)
      ..write(obj.roastingDate)
      ..writeByte(5)
      ..write(obj.origin)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeanImpl _$$BeanImplFromJson(Map<String, dynamic> json) => _$BeanImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      roastLevel: json['roastLevel'] as String,
      roastingDate: json['roastingDate'] == null
          ? null
          : DateTime.parse(json['roastingDate'] as String),
      origin: json['origin'] as String?,
      notes: json['notes'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$BeanImplToJson(_$BeanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'roastLevel': instance.roastLevel,
      'roastingDate': instance.roastingDate?.toIso8601String(),
      'origin': instance.origin,
      'notes': instance.notes,
      'imageUrl': instance.imageUrl,
    };
