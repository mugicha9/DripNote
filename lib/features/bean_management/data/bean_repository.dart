
import '../domain/bean.dart';

abstract class BeanRepository {
  Future<List<Bean>> fetchAll();
  Future<void> save(Bean bean);
  Future<void> delete(String id);
}