import 'package:dripnote/features/recipe_list/data/recipe_repository_impl.dart';
import 'package:dripnote/features/recipe_list/domain/recipe.dart';
import 'package:dripnote/features/recipe_list/domain/recipe_usecases.dart';
import 'package:dripnote/features/recipe_list/presentation/recipe_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class RecipeEditPage extends ConsumerStatefulWidget {
  final String? recipeId;
  const RecipeEditPage({super.key, this.recipeId});

  @override
  _RecipeEditPageState createState() => _RecipeEditPageState();
}

class _RecipeEditPageState extends ConsumerState<RecipeEditPage> {
  final _formKey = GlobalKey<FormState>();
  static const _uuid = Uuid();
  
  // Form Temp Values
  String? _title;
  String? _water;
  String? _coffee;
  String? _temperature;
  String? _grain;
  List<String>? _steps;

  Recipe? _original;

  @override
  void initState() {
    super.initState();
    if (widget.recipeId != null) {
      ref
        .read(recipeRepositoryProvider)
        .fetchAll()
        .then((all) {
          final r = all.firstWhere((e) => e.id == widget.recipeId);
          setState(() => _original = r);
        });
    }
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final newRecipe = Recipe(
      id: _original?.id ?? _uuid.v4(),
      title: _title!.trim(),
      waterAmount: _water!.isNotEmpty ? double.tryParse(_water!) : null,
      coffeeAmount: _coffee!.isNotEmpty ? double.tryParse(_coffee!) : null,
      temperature: _temperature!.isNotEmpty ? double.tryParse(_temperature!) : null,
      grain: _grain,
      steps: _steps,
    );

    await SaveRecipe(ref.read(recipeRepositoryProvider))(newRecipe);
    await ref.read(recipeListProvider.notifier).load();
    if (mounted) context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeId == null ? 'Recipe Create' : 'Recipe Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _original?.title,
                decoration: const InputDecoration(labelText: 'タイトル'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:(v) => v == null || v.isEmpty ? '必須です' : null,
                onSaved: (v) => _title = v,
              ),
              TextFormField(
                initialValue: _original?.waterAmount.toString(),
                decoration: const InputDecoration(labelText: '水量 (ml)'),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
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
                initialValue: _original?.coffeeAmount.toString(),
                decoration: const InputDecoration(labelText: 'コーヒー量 (ml)'),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
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
                initialValue: _original?.temperature.toString(),
                decoration: const InputDecoration(labelText: '水温'),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
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
                initialValue: _original?.grain,
                decoration: const InputDecoration(labelText: '挽き目'),
                onSaved: (v) => _grain = v,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onSave,
                child: const Text('保存')
              ),
            ],
          )
        )
      )
    );
  }
}