import 'package:result_dart/result_dart.dart';

abstract class BaseRepository<T extends Object> {
  Future<Result<List<T>>> getAll();
  Future<Result<T>> getById(int id);
  Future<Result<int>> insert(T item);
  Future<Result<int>> update(T item, int id);
  Future<Result<int>> delete(int id);
}
