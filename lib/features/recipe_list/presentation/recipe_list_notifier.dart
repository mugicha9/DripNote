import 'package:dripnote/features/recipe_list/application/recipe_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/recipe_repository_impl.dart';
import '../domain/recipe.dart';

final recipeListProvider = StateNotifierProvider<RecipeListNotifier, AsyncValue<List<Recipe>>>((ref) {
  final repo = ref.read(recipeRepositoryProvider);
  return RecipeListNotifier(GetAllRecipes(repo), SaveRecipe(repo), DeleteRecipe(repo))..load();
});

class RecipeListNotifier extends StateNotifier<AsyncValue<List<Recipe>>> {
  final GetAllRecipes _getAllRecipes;
  final SaveRecipe _saveRecipe;
  final DeleteRecipe _deleteRecipe;

  RecipeListNotifier(this._getAllRecipes, this._saveRecipe, this._deleteRecipe) : super(const AsyncValue.loading());

  Future<void> load() async {
    state = await AsyncValue.guard(() => _getAllRecipes());
  }

  Future<void> save(Recipe recipe) async {
    final result = await AsyncValue.guard(() => _saveRecipe(recipe));
    if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
      return;
    }
    // UpdateLocalValue
    state = state.whenData((list) {
      final idx = list.indexWhere((r) => r.id == recipe.id);
      if (idx == -1) return [...list, recipe];
      final newList = [...list]..[idx] = recipe;
      return newList;
    });
  }

  Future<void> delete(String id) async {
    final result = await AsyncValue.guard(() => _deleteRecipe(id));
    if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
      return;
    }
    state = state.whenData(
      (list) => list.where((r) => r.id != id).toList()
    );
  }
}