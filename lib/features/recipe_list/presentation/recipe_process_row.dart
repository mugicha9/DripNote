import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'recipe_edit_notifier.dart';
import '../domain/recipe_process_step.dart';
import '../domain/recipe_process_type.dart';

class RecipeProcessRow extends ConsumerWidget {
  final String? recipeId;
  final RecipeProcessStep step;
  final int currentIndex;

  const RecipeProcessRow({super.key, required this.recipeId, required this.step, required this.currentIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(recipeEditProvider(recipeId).notifier);
    final label = switch (step.type) {
      RecipeProcessType.pour => '水量 (g)',
      RecipeProcessType.wait => '待ち時間 (s)',
      RecipeProcessType.stir => '回数',
    };

    return Row(
      children: [
        ReorderableDragStartListener(
          index: currentIndex,
          child: const Icon(Icons.drag_handle),
        ),
        DropdownButton<RecipeProcessType>(
          value: step.type,
          items: RecipeProcessType.values.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type.name),
            );
          }).toList(),
          onChanged: (newType) {
            if (newType != null) {
              notifier.updateStepType(step.id, newType);
            }
          },
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: TextFormField(
            initialValue: step.value.toString(),
            decoration: InputDecoration(labelText: label),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (v) {
              final val = int.tryParse(v) ?? 0;
              notifier.updateStepValue(step.id, val);
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => notifier.removeStep(step.id),
        ),
      ]
    );
  }
}