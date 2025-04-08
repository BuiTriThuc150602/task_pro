import 'package:flutter/material.dart';
import 'package:task_your_life/models/sub_task.dart';
import 'package:task_your_life/repositories/subtask_repository.dart';

class SubTaskViewModel extends ChangeNotifier {
  final SubTaskRepository _subTaskRepository;

  List<SubTask> subTasks = [];
  bool isLoading = false;

  SubTaskViewModel(this._subTaskRepository);

  Future<void> fetchSubTasks() async {
    isLoading = true;
    notifyListeners();

    subTasks = await _subTaskRepository.getAll();

    isLoading = false;
    notifyListeners();
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
