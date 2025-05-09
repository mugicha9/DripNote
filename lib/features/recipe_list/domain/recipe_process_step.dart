import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'recipe_process_type.dart';

part 'recipe_process_step.freezed.dart';
part 'recipe_process_step.g.dart';

@freezed
@HiveType(typeId: 2)
class RecipeProcessStep with _$RecipeProcessStep {
  const factory RecipeProcessStep({
    @HiveField(0) required String id,
    @HiveField(1) required RecipeProcessType type,
    @HiveField(2) required int value,
  }) = _RecipeProcessStep;

  factory RecipeProcessStep.fromJson(Map<String, dynamic> json) => _$RecipeProcessStepFromJson(json);
}