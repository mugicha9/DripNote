import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'bean_edit_notifier.dart';
import 'bean_list_notifier.dart';

class BeanEditPage extends ConsumerWidget {
  final String? beanId;
  const BeanEditPage({super.key, this.beanId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bean = ref.watch(beanEditProvider(beanId));

    return Scaffold(
        appBar: AppBar(
          title: Text(beanId == null ? 'Add Bean' : 'Edit Bean'),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {if (context.mounted) context.goNamed('home');},
            ),
            IconButton(
              icon: const Icon(Icons.save), 
              onPressed: () async {
                await ref.read(beanListProvider.notifier).save(bean); 
                if (context.mounted) context.goNamed('home');
              },
            )
          ]
        ),
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
            ],
          ),
        ),
      );
  }
}