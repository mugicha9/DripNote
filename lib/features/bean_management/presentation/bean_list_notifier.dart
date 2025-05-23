import 'package:dripnote/features/bean_management/application/bean_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/bean_repository_impl.dart';
import '../domain/bean.dart';

class BeanListNotifier extends StateNotifier<AsyncValue<List<Bean>>> {
  final GetAllBeans _getAllBeans;
  final SaveBean _saveBean;
  final DeleteBean _deleteBean;

  BeanListNotifier(this._getAllBeans, this._saveBean, this._deleteBean) : super(const AsyncValue.loading());

  Future<void> load() async {
    state = await AsyncValue.guard(() => _getAllBeans());
  }

  Future<void> save(Bean bean) async {
    final result = await AsyncValue.guard(() => _saveBean(bean));
    if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
      return;
    }
    // UpdateLocalValue
    state = state.whenData((list) {
      final idx = list.indexWhere((r) => r.id == bean.id);
      if (idx == -1) return [...list, bean];
      final newList = [...list]..[idx] = bean;
      return newList;
    });
  }

  Future<void> delete(String id) async {
    final result = await AsyncValue.guard(() => _deleteBean(id));
    if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
      return;
    }
    state = state.whenData(
      (list) => list.where((r) => r.id != id).toList()
    );
  }
}

final beanListProvider = StateNotifierProvider<BeanListNotifier, AsyncValue<List<Bean>>>((ref) {
  final repo = ref.read(beanRepositoryProvider);
  return BeanListNotifier(GetAllBeans(repo), SaveBean(repo), DeleteBean(repo))..load();
});