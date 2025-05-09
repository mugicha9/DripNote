import 'recipe.dart';
import 'recipe_repository.dart';

class GetAllRecipes {
  final RecipeRepository repository;
  GetAllRecipes(this.repository);

  Future<List<Recipe>> call() async {
    return await repository.fetchAll();
  }
}

class SaveRecipe {
  final RecipeRepository repository;
  SaveRecipe(this.repository);

  Future<void> call(Recipe recipe) async {
    await repository.save(recipe);
  }
}