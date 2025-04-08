import 'package:task_your_life/models/sub_task.dart';
import 'base_service.dart';

class SubTaskService extends BaseService<SubTask> {
  SubTaskService()
      : super(
          tableName: 'subtasks',
          fromMap: (map) => SubTask.fromJson(map),
          toMap: (subtask) => subtask.toJson(),
        );
}
