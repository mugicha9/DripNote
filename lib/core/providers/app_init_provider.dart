import 'package:dripnote/features/recipe_list/application/recipe_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appInitProvider = FutureProvider<void>((ref) async {
  await ref.read(recipeListProvider.notifier).load();
});