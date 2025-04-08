abstract class BaseRepository<T> {
  Future<List<T>> getAll();
  Future<T?> getById(int id);
  Future<int> insert(T item);
  Future<int> update(T item, int id);
  Future<int> delete(int id);
}
