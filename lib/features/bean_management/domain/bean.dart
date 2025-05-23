
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'bean.freezed.dart';
part 'bean.g.dart';

@freezed
@HiveType(typeId: 3)
class Bean with _$Bean {
  factory Bean({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required int quantity,
    @HiveField(3) required String roastLevel,
    @HiveField(4) DateTime? roastingDate,
    @HiveField(5) String? origin, //産地
    @HiveField(6) String? notes,
    @HiveField(7) String? imageUrl,
  }) = _Bean;

  factory Bean.fromJson(Map<String, dynamic> json) => _$BeanFromJson(json);
}