import 'package:task_your_life/models/task.dart';
import 'package:task_your_life/services/task_service.dart';
import 'base_repository.dart';

class TaskRepository implements BaseRepository<Task> {
  final TaskService _taskService;

  TaskRepository(this._taskService);

  @override
  Future<List<Task>> getAll() => _taskService.getAll();

  @override
  Future<Task?> getById(int id) => _taskService.getById(id);

  @override
  Future<int> insert(Task item) => _taskService.insert(item);

  @override
  Future<int> update(Task item, int id) => _taskService.update(item, id);

  @override
  Future<int> delete(int id) => _taskService.delete(id);
}
