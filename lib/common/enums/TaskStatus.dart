enum TaskStatus {
  TODO,
  IN_PROGRESS,
  PULL_REQUEST,
  DONE,
  ASIGNED,
  IN_REVIEW,
  BLOCKED,
  CANCELED,
  ON_HOLD,
}

extension TaskStatusExtension on TaskStatus {
  int get toInt => index;

  static TaskStatus fromInt(int index) {
    if (index < 0 || index >= TaskStatus.values.length) {
      return TaskStatus.values[0];
    }
    return TaskStatus.values[index];
  }
}
