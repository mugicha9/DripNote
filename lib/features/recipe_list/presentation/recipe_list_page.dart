// import 'package:dripnote/features/recipe_list/data/recipe_repository_impl.dart';
// import 'package:dripnote/features/recipe_list/domain/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

class RecipeListPage extends ConsumerWidget {
  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(recipeListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: recipesAsync.when(
        loading:() => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (recipes) {
          if (recipes.isEmpty) {
            return const Center(child: Text('No recipes yet.'));
          }
          return ListView.separated(
            separatorBuilder: (_, _) => const Divider(),
            itemCount: recipes.length,
            itemBuilder: (context, idx) {
              final recipe = recipes[idx];
              return ListTile(
                title: Text(recipe.title),
                onTap: null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () {
                        context.goNamed('recipeEdit', pathParameters: {'id': recipe.id});
                      }
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () async {
                        await ref
                            .read(recipeListProvider.notifier)
                            .delete(recipe.id);
                      }
                    )
                  ]
                ),
              );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('recipeCreate');
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}