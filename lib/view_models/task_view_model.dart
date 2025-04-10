import 'package:flutter/material.dart';
import 'package:task_your_life/models/task.dart';
import 'package:task_your_life/repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository;

  List<Task> _tasks = [];
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = '';
  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;

  TaskViewModel(this._taskRepository);

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();

    await _taskRepository.getAll().then((result) {
      result.fold(
        (tasksList) {
          _tasks = tasksList;
          _isError = false;
          _errorMessage = '';
        },
        (error) {
          _isError = true;
          _errorMessage = error.toString();
          _tasks = [];
        },
      );
    });
    _isLoading = false;
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
