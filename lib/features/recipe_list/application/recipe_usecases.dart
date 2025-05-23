import '../domain/recipe.dart';
import '../data/recipe_repository.dart';

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

class DeleteRecipe {
  final RecipeRepository repository;
  DeleteRecipe(this.repository);

  Future<void> call(String id) async {
    await repository.delete(id);
  }
}