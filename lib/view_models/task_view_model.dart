import 'package:flutter/material.dart';
import 'package:task_your_life/models/task.dart';
import 'package:task_your_life/repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository;

  List<Task> tasks = [];
  bool isLoading = false;

  TaskViewModel(this._taskRepository);

  Future<void> fetchTasks() async {
    isLoading = true;
    notifyListeners();

    tasks = await _taskRepository.getAll();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _taskRepository.insert(task);
    await fetchTasks();
  }

  Future<void> updateTask(Task task, int id) async {
    await _taskRepository.update(task, id);
    await fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _taskRepository.delete(id);
    await fetchTasks();
  }
}
