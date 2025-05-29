import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'bean_list_notifier.dart';

class BeanManagementPage extends ConsumerWidget {
  const BeanManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beansAsync = ref.watch(beanListProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Beans')),
      body: beansAsync.when(
        data: (beans) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: beans.length,
          itemBuilder: (_, i) {
            final bean = beans[i];
            return GestureDetector(
              onTap: () => context.goNamed('beanEdit', pathParameters: {'id':bean.id}),
              child: Card(
                child: bean.imageUrl != null
                    ? Image.network(bean.imageUrl!)
                    : Center(child: Text(bean.name)),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: \$e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed('beanCreate'),
        child: Icon(Icons.add),
      ),
    );
  }
}