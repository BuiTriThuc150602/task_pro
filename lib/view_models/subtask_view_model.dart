import 'package:flutter/material.dart';
import 'package:task_your_life/models/sub_task.dart';
import 'package:task_your_life/repositories/subtask_repository.dart';

class SubTaskViewModel extends ChangeNotifier {
  final SubTaskRepository _subTaskRepository;

  List<SubTask> subTasks = [];
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;

  SubTaskViewModel(this._subTaskRepository);

  Future<void> fetchSubTasks() async {
    _isLoading = true;
    _isError = false;
    _errorMessage = '';
    notifyListeners();

    await _subTaskRepository.getAll().then((result) {
      result.fold(
        (subTasksList) {
          subTasks = subTasksList;
          _isLoading = false;
          _isError = false;
          _errorMessage = '';
          notifyListeners();
        },
        (error) {
          _isLoading = false;
          _isError = true;
          _errorMessage = error.toString();
          subTasks = [];
          notifyListeners();
        },
      );
    });
  }

  Future<void> addSubTask(SubTask subTask) async {
    await _subTaskRepository.insert(subTask);
    await fetchSubTasks();
  }

  Future<void> updateSubTask(SubTask subTask, int id) async {
    await _subTaskRepository.update(subTask, id);
    await fetchSubTasks();
  }

  Future<void> deleteSubTask(int id) async {
    await _subTaskRepository.delete(id);
    await fetchSubTasks();
  }
}
