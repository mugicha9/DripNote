import '../data/bean_repository.dart';
import '../domain/bean.dart';

class GetAllBeans {
  final BeanRepository repo;
  GetAllBeans(this.repo);

  Future<List<Bean>> call() => repo.fetchAll();
}

class SaveBean {
  final BeanRepository repo;
  SaveBean(this.repo);
  
  Future<void> call(Bean bean) async => await repo.save(bean);
}

class DeleteBean {
  final BeanRepository repo;
  DeleteBean(this.repo);

  Future<void> call(String id) async => await repo.delete(id);
}