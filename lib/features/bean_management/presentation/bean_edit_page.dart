import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'bean_edit_notifier.dart';
import 'bean_list_notifier.dart';

class BeanEditPage extends ConsumerStatefulWidget {
  final String? beanId;
  const BeanEditPage({super.key, this.beanId});

  @override
  _BeanEditPageState createState() => _BeanEditPageState();
}

class _BeanEditPageState extends ConsumerState<BeanEditPage> {
  final _formKey = GlobalKey<FormState>();

  Future<bool> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    _formKey.currentState!.save();

    final bean = ref.read(beanEditProvider(widget.beanId));
    await ref.read(beanListProvider.notifier).save(bean);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final bean = ref.watch(beanEditProvider(widget.beanId));
    final notifier = ref.watch(beanEditProvider(widget.beanId).notifier);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.beanId == null ? 'Add Bean' : 'Edit Bean'),
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
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: TextEditingController(text: bean.name),
                  decoration: InputDecoration(labelText: '名前'),
                  onSaved: (v) => notifier.updateName(v ?? ""),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) => v == null || v.isEmpty ? '必須です' : null,
                ),
                TextFormField(
                  controller: TextEditingController(text: bean.quantity.toString()),
                  decoration: InputDecoration(labelText: '量'),
                  onSaved: (v) => notifier.updateQuantity(v != null ? int.tryParse(v)! : 0),
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
                ),
                TextFormField(
                  controller: TextEditingController(text: bean.roastLevel),
                  decoration: InputDecoration(labelText: '焙煎度'),
                  onSaved: (v) => notifier.updateRoastLevel(v ?? ""),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) => v == null || v.isEmpty ? '必須です' : null,
                ),
                TextFormField(
                  controller: TextEditingController(text: bean.roastingDate == null ? "" : DateFormat('yyyy/MM/dd').format(bean.roastingDate!)),
                  decoration: InputDecoration(labelText: '焙煎日', hintText: 'タップして日付を選択', suffix: Icon(Icons.calendar_today)),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (pickedDate != null){
                      notifier.updateRoastingDate(pickedDate);
                    }
                  },
                ),
                TextFormField(
                  controller: TextEditingController(text: bean.origin),
                  decoration: InputDecoration(labelText: '産地'),
                  onSaved: (v) => notifier.updateOrigin(v ?? "")
                ),
                TextFormField(
                  controller: TextEditingController(text: bean.notes),
                  decoration: InputDecoration(labelText: 'メモ'),
                  onSaved: (v) => notifier.updateNotes(v ?? "")
                ),
                Text("画像用の何か")
              ],
            ),
          ),
        ),
      );
  }
}