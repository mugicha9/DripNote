import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../domain/recipe.dart';
import '../domain/recipe_repository.dart';

// Directory Throw JSON into Hive Box
class RecipeRepositoryImpl implements RecipeRepository {
  final Box _box;

  RecipeRepositoryImpl(this._box);

  @override
  Future<List<Recipe>> fetchAll() async {
    final values = _box.toMap().values;
    return values.map((json) {
      return Recipe.fromJson(Map<String, dynamic>.from(json as Map));
    }).toList();
  }

  @override
  Future<void> save(Recipe recipe) async {
    await _box.put(recipe.id, recipe.toJson());
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }
}

/// Hive Box プロバイダ（Riverpod 用）
final recipeBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError();
});

/// レシピリポジトリプロバイダ
final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final box = ref.watch(recipeBoxProvider);
  return RecipeRepositoryImpl(box);
});
