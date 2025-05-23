import 'package:dripnote/features/bean_management/data/bean_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/bean.dart';

class BeanEditNotifier extends StateNotifier<Bean> {
  BeanEditNotifier(Bean initial) : super(initial);

  void updateName(String name) => state = state.copyWith(name: name);
  void updateQuantity(int quantity) => state = state.copyWith(quantity: quantity);
  void updateRoastLevel(String roast) => state = state.copyWith(roastLevel: roast);
  void updateRoastingDate(DateTime date) => state = state.copyWith(roastingDate: date);
  void updateOrigin(String origin) => state = state.copyWith(origin: origin);
  void updateNotes(String notes) => state = state.copyWith(notes: notes);
  void updateImageUrl(String url) => state = state.copyWith(imageUrl: url);

  Future<void> save() async {
    //await useCases.addOrUpdateBean(state);
  }
}

final beanEditProvider = StateNotifierProvider.autoDispose.family<BeanEditNotifier, Bean, String?>((ref, recipeId) {
  // fetch recipeId == bean.id (rep)
  Bean a_bean;
  return BeanEditNotifier(a_bean);
});