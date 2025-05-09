import 'package:dripnote/features/recipe_list/application/recipe_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../domain/recipe.dart';
import '../domain/recipe_process_step.dart';
import '../domain/recipe_process_type.dart';

class RecipeEditNotifier extends StateNotifier<Recipe> {
  static final _uuid = Uuid();
  RecipeEditNotifier(super.recipe);

  /// タイトル更新
  void updateTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }

  /// 水量更新
  void updateWaterAmount(int? newWater) {
    state = state.copyWith(waterAmount: newWater);
  }

  /// コーヒー量更新
  void updateCoffeeAmount(int? newCoffee) {
    state = state.copyWith(coffeeAmount: newCoffee);
  }

  /// 温度更新
  void updateTemperature(int? newTemp) {
    state = state.copyWith(temperature: newTemp);
  }

  /// 粒度更新
  void updateGrain(String? newGrain) {
    state = state.copyWith(grain: newGrain);
  }

  void updateStepType(String stepId, RecipeProcessType newType) {
    final updated = state.steps
      ?.map((s) => s.id == stepId ? s.copyWith(type: newType) : s)
      .toList();
    state = state.copyWith(steps: updated);
  }

  void updateStepValue(String stepId, int newValue) {
    final updated = state.steps
      ?.map((s) => s.id == stepId ? s.copyWith(value: newValue) : s)
      .toList();
    state = state.copyWith(steps: updated);
  }

  void addStep(RecipeProcessType type) {
    final newStep = RecipeProcessStep(
      id: _uuid.v4(),
      type: type,
      value: 0,
    );
    state = state.copyWith(steps: [...?state.steps, newStep]);
  }

  void removeStep(String stepId) {
    state = state.copyWith(
      steps: state.steps?.where((s) => s.id != stepId).toList(),
    );
  }

  void reorderSteps(int oldIndex, int newIndex) {
    final list = [...?state.steps];
    final item = list.removeAt(oldIndex);
    list.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, item);
    state = state.copyWith(steps: list);
  }
}

final recipeEditProvider = StateNotifierProvider.autoDispose.family<RecipeEditNotifier, Recipe, String?>((ref, recipeId) {
  final listState = ref.read(recipeListProvider);
  final existing = listState.maybeWhen(
    data: (list) => recipeId != null
      ? list.firstWhere((r) => r.id == recipeId)
      : null,
    orElse: () => null,
  );

  final base = existing ??
    Recipe(
      id: Uuid().v4(),
      title: '',
      waterAmount: null,
      coffeeAmount: null,
      temperature: null,
      grain: null,
      steps: [],
    );
  return RecipeEditNotifier(base);
});