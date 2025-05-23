
import 'package:dripnote/features/bean_management/domain/bean.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'bean_repository.dart';

class BeanRepositoryImpl implements BeanRepository {
  final Box<Bean> _box;
  BeanRepositoryImpl(this._box);

  @override
  Future<List<Bean>> fetchAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> save(Bean bean) async {
    await _box.put(bean.id, bean);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }
}

/// Hive Box プロバイダ（Riverpod 用）
final beanBoxProvider = Provider<Box<Bean>>((ref) {
  throw UnimplementedError();
});

/// リポジトリプロバイダ
final beanRepositoryProvider = Provider<BeanRepository>((ref) {
  final box = ref.read(beanBoxProvider);
  return BeanRepositoryImpl(box);
});
