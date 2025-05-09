import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/recipe_repository_impl.dart';
import '../domain/recipe.dart';
import '../domain/recipe_repository.dart';

final recipeListProvider = StateNotifierProvider<RecipeListNotifier, AsyncValue<List<Recipe>>>((ref) {
  final repo = ref.watch(recipeRepositoryProvider);
  return RecipeListNotifier(repo)..load();
});

class RecipeListNotifier extends StateNotifier<AsyncValue<List<Recipe>>> {
  RecipeListNotifier(this._repo) : super(const AsyncValue.loading());
  final RecipeRepository _repo;

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final list = await _repo.fetchAll();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> delete(String id) async {
    try {
      await _repo.delete(id);
      final updated = await _repo.fetchAll();
      state = AsyncValue.data(updated);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}