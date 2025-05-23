import '../domain/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchAll();

  Future<void> save(Recipe recipe);
  Future<void> delete(String id);
}