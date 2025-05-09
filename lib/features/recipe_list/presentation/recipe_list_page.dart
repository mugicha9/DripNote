// import 'package:dripnote/features/recipe_list/data/recipe_repository_impl.dart';
// import 'package:dripnote/features/recipe_list/domain/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/recipe_list_notifier.dart';

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