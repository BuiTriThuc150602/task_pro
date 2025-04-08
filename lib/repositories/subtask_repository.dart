import 'package:task_your_life/models/sub_task.dart';
import 'package:task_your_life/services/subtask_service.dart';
import 'base_repository.dart';

class SubTaskRepository implements BaseRepository<SubTask> {
  final SubTaskService _subTaskService;

  SubTaskRepository(this._subTaskService);

  @override
  Future<List<SubTask>> getAll() => _subTaskService.getAll();

  @override
  Future<SubTask?> getById(int id) => _subTaskService.getById(id);

  @override
  Future<int> insert(SubTask item) => _subTaskService.insert(item);

  @override
  Future<int> update(SubTask item, int id) => _subTaskService.update(item, id);

  @override
  Future<int> delete(int id) => _subTaskService.delete(id);
}
