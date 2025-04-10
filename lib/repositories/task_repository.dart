import 'package:result_dart/src/types.dart';
import 'package:task_your_life/models/task.dart';
import 'package:task_your_life/services/task_service.dart';
import 'base_repository.dart';

class TaskRepository implements BaseRepository<Task> {
  final TaskService _taskService;

  TaskRepository(this._taskService);

  @override
  Future<Result<List<Task>>> getAll() => _taskService.getAll();

  @override
  Future<Result<Task>> getById(int id) => _taskService.getById(id);

  @override
  Future<Result<int>> insert(Task item) => _taskService.insert(item);

  @override
  Future<Result<int>> update(Task item, int id) =>
      _taskService.update(item, id);

  @override
  Future<Result<int>> delete(int id) => _taskService.delete(id);
}
