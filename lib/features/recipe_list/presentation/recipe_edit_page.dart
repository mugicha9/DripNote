import 'package:dripnote/features/recipe_list/presentation/recipe_edit_notifier.dart';
import 'package:dripnote/features/recipe_list/data/recipe_repository_impl.dart';
import 'package:dripnote/features/recipe_list/application/recipe_usecases.dart';
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

  late String _title;
  String? _water;
  String? _coffee;
  String? _temperature;
  String? _grain;

  @override
  void initState() {
    super.initState();
    _initEditState();
  }

  void _initEditState() {
    final recipe = ref.read(recipeEditProvider(widget.recipeId));
    _title = recipe.title;
    _water = recipe.waterAmount?.toString();
    _coffee = recipe.coffeeAmount?.toString();
    _temperature = recipe.temperature?.toString();
    _grain = recipe.grain;
  }

  
  Future<bool> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    _formKey.currentState!.save();

    // Update Each Values
    final notifier = ref.read(recipeEditProvider(widget.recipeId).notifier);
    notifier.updateTitle(_title);
    notifier.updateWaterAmount(_water != null && _water!.isNotEmpty ? int.tryParse(_water!) : null);
    notifier.updateCoffeeAmount(_coffee != null && _coffee!.isNotEmpty ? int.tryParse(_coffee!) : null);
    notifier.updateTemperature(_temperature != null && _temperature!.isNotEmpty ? int.tryParse(_temperature!) : null);
    notifier.updateGrain(_grain);

    final edited = ref.read(recipeEditProvider(widget.recipeId));

    await SaveRecipe(ref.read(recipeRepositoryProvider))(edited);
    await ref.watch(recipeListProvider.notifier).load();

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
                onSaved: (v) => _title = v!,
              ),
              TextFormField(
                initialValue: _water,
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
                onSaved: (v) => _water = v,
              ),
              TextFormField(
                initialValue: _coffee,
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
                onSaved: (v) => _coffee = v,
              ),
              TextFormField(
                initialValue: _temperature,
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
                onSaved: (v) => _temperature = v,
              ),
              TextFormField(
                initialValue: _grain,
                decoration: const InputDecoration(labelText: '挽き目'),
                onSaved: (v) => _grain = v,
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