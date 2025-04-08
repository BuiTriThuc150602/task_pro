import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_your_life/common/enums/TaskStatus.dart';

part 'sub_task.freezed.dart';
part 'sub_task.g.dart';

@freezed
class SubTask with _$SubTask {
  const factory SubTask({
    int? id,
    required int taskId,
    required String title,
    @Default(TaskStatus.TODO) TaskStatus status,
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);
}
