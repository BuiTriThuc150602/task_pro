import 'package:task_your_life/models/task.dart';
import 'base_service.dart';

class TaskService extends BaseService<Task> {
  TaskService()
      : super(
          tableName: 'tasks',
          fromMap: (map) => Task.fromJson(map),
          toMap: (task) => task.toJson(),
        );
}
