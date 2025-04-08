import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_your_life/common/enums/TaskLevel.dart';
import 'package:task_your_life/common/enums/TaskStatus.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    int? id,
    required int userId,
    required String title,
    String? description,
    DateTime? dueDate,
    @Default(TaskStatus.TODO) TaskStatus status,
    @Default(TaskLevel.NONE) TaskLevel level,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
