import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../domain/recipe.dart';
import 'recipe_repository.dart';

// Directory Throw JSON into Hive Box
class RecipeRepositoryImpl implements RecipeRepository {
  final Box<Recipe> _box;

  RecipeRepositoryImpl(this._box);

  @override
  Future<List<Recipe>> fetchAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> save(Recipe recipe) async {
    await _box.put(recipe.id, recipe);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }
}

/// Hive Box プロバイダ（Riverpod 用）
final recipeBoxProvider = Provider<Box<Recipe>>((ref) {
  throw UnimplementedError();
});

/// レシピリポジトリプロバイダ
final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final box = ref.read(recipeBoxProvider);
  return RecipeRepositoryImpl(box);
});
