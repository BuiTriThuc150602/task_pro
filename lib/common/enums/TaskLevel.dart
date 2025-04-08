enum TaskLevel {
  NONE,
  LOW,
  MEDIUM,
  HIGH,
  URGENT,
  CRITICAL,
  BLOCKER,
  TRIVIAL,
  MAJOR,
  MINOR,
}

extension TaskLevelExtension on TaskLevel {
  int get toInt => index;

  TaskLevel fromInt(int value) {
    if (value < 0 || value >= TaskLevel.values.length) {
      return TaskLevel.values[0];
    }
    return TaskLevel.values[value];
  }
}
