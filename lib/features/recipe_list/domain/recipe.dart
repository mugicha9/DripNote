import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'recipe_process_step.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
@HiveType(typeId: 0)
class Recipe with _$Recipe {
  const factory Recipe({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) int? waterAmount,
    @HiveField(3) int? coffeeAmount,
    @HiveField(4) int? temperature,
    @HiveField(5) String? grain,
    @HiveField(6) List<RecipeProcessStep>? steps,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}