import 'package:hive/hive.dart';

part 'recipe_process_type.g.dart';

@HiveType(typeId: 1)
enum RecipeProcessType {
  @HiveField(0) pour,
  @HiveField(1) wait,
  @HiveField(2) stir,
}