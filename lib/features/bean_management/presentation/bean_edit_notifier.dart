import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../domain/bean.dart';
import 'bean_list_notifier.dart';

class BeanEditNotifier extends StateNotifier<Bean> {
  BeanEditNotifier(super.initial);

  void updateName(String name) => state = state.copyWith(name: name);
  void updateQuantity(int quantity) => state = state.copyWith(quantity: quantity);
  void updateRoastLevel(String roast) => state = state.copyWith(roastLevel: roast);
  void updateRoastingDate(DateTime date) => state = state.copyWith(roastingDate: date);
  void updateOrigin(String origin) => state = state.copyWith(origin: origin);
  void updateNotes(String notes) => state = state.copyWith(notes: notes);
  void updateImageUrl(String url) => state = state.copyWith(imageUrl: url);

}

final beanEditProvider = StateNotifierProvider.autoDispose.family<BeanEditNotifier, Bean, String?>((ref, beanId) {
  final listState = ref.read(beanListProvider);
  final existing = listState.maybeWhen(
    data: (list) => beanId != null
      ? list.firstWhere((r) => r.id == beanId)
      : null,
    orElse: () => null,
  );

  final base = existing ??
    Bean(
      id: Uuid().v4(),
      name: '',
      quantity: 0,
      roastLevel: '',
      roastingDate: null,
      origin: null,
      notes: null,
      imageUrl: null
    );
  return BeanEditNotifier(base);
});