import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bean_edit_notifier.dart';

class BeanEditPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beanId = ModalRoute.of(context)!.settings.arguments as String?;
    final beanAsync = ref.watch(beanEditProvider(beanId));

    return beanAsync.when(
      data: (bean) => Scaffold(
        appBar: AppBar(title: Text(beanId == null ? 'Add Bean' : 'Edit Bean')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: bean.name),
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (v) => ref.read(beanEditProvider(beanId).notifier).updateName(v),
              ),
              // 同様にQuantity, RoastLevel, etc.
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await ref.read(beanEditProvider(beanId).notifier).save();
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: \$e'))),
    );
  }
}