import 'package:dripnote/features/recipe_list/presentation/recipe_edit_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'recipe_list_notifier.dart';
import '../domain/recipe_process_type.dart';
import 'recipe_process_row.dart';

class RecipeEditPage extends ConsumerStatefulWidget {
  final String? recipeId;
  const RecipeEditPage({super.key, this.recipeId});

  @override
  _RecipeEditPageState createState() => _RecipeEditPageState();
}

class _RecipeEditPageState extends ConsumerState<RecipeEditPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  
  Future<bool> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    _formKey.currentState!.save();

    final edited = ref.read(recipeEditProvider(widget.recipeId));

    final listNotifier = ref.read(recipeListProvider.notifier);

    await listNotifier.save(edited);
    await listNotifier.load();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final recipe = ref.watch(recipeEditProvider(widget.recipeId));
    final notifier = ref.watch(recipeEditProvider(widget.recipeId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeId == null ? 'Recipe Create' : 'Recipe Edit'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {if (context.mounted) context.goNamed('home');},
          ),
          IconButton(
            icon: const Icon(Icons.save), 
            onPressed: () async {
              final ok = await _onSave(); 
              if (!ok) return;
              if (context.mounted) context.goNamed('home');
            },
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: recipe.title,
                decoration: const InputDecoration(labelText: 'タイトル'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v == null || v.isEmpty ? '必須です' : null,
                onSaved: (v) => notifier.updateTitle(v ?? ""),
              ),
              TextFormField(
                initialValue: recipe.waterAmount?.toString() ?? "",
                decoration: const InputDecoration(labelText: '水量 (ml)'),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return null;
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                    return '数字のみ入力してください';
                  }
                  return null;
                },
                onSaved: (v) => notifier.updateWaterAmount(int.tryParse(v ?? "")),
              ),
              TextFormField(
                initialValue: recipe.coffeeAmount?.toString() ?? "",
                decoration: const InputDecoration(labelText: 'コーヒー量 (ml)'),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return null;
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                    return '数字のみ入力してください';
                  }
                  return null;
                },
                onSaved: (v) => notifier.updateCoffeeAmount(int.tryParse(v ?? "")),
              ),
              TextFormField(
                initialValue: recipe.temperature?.toString() ?? "",
                decoration: const InputDecoration(labelText: '水温'),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return null;
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                    return '数字のみ入力してください';
                  }
                  return null;
                },
                onSaved: (v) => notifier.updateTemperature(int.tryParse(v ?? "")),
              ),
              TextFormField(
                initialValue: recipe.grain ?? "",
                decoration: const InputDecoration(labelText: '挽き目'),
                onSaved: (v) => notifier.updateGrain(v ?? ""),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 8),
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: recipe.steps?.length ?? 0,
                  onReorder: (oldIndex, newIndex) => notifier.reorderSteps(oldIndex, newIndex),
                  itemBuilder: (context, index) {
                    final step = recipe.steps![index];
                    return RecipeProcessRow(
                      key: ValueKey(step.id),
                      recipeId: widget.recipeId,
                      step: step,
                      currentIndex: index,
                    );
                  },
                )
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: RecipeProcessType.values.map((type) {
                  return IconButton(
                    icon: Icon(_iconForProcess(type)),
                    onPressed: () => notifier.addStep(type),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

IconData _iconForProcess(RecipeProcessType type) {
  switch (type) {
    case RecipeProcessType.pour:
      return Icons.opacity;
    case RecipeProcessType.wait:
      return Icons.timer;
    case RecipeProcessType.stir:
      return Icons.loop;
  }
} 