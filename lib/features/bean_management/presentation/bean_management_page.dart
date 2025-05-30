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
          itemBuilder: (context, i) {
            final bean = beans[i];
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => context.goNamed('beanEdit', pathParameters: {'id':bean.id}),
                  child: Card(
                    child: bean.imageUrl != null && bean.imageUrl!.isNotEmpty
                        ? Image.network(bean.imageUrl!)
                        : Center(child: Text(bean.name)),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                            title: const Text("確認"),
                            content: Text('${bean.name} を本当に削除しますか？'),
                            actions: [
                              TextButton(
                                child: const Text('キャンセル'),
                                onPressed: () {
                                  Navigator.of(dialogContext).pop(false);
                                }
                              ),
                              TextButton(
                                child: const Text('削除する', style: TextStyle(color: Colors.red)),
                                onPressed: () {
                                  Navigator.of(dialogContext).pop(true);
                                },
                              )
                            ]
                          );
                        },
                      );
                      if (confirm == true) {
                        await ref.read(beanListProvider.notifier).delete(bean.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${bean.name} を削除しました')),
                          );
                        }
                      }
                    },
                  ),
                )
              ]
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