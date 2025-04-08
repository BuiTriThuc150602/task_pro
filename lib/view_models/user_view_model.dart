import 'package:flutter/material.dart';
import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  List<User> users = [];
  bool isLoading = false;

  UserViewModel(this._userRepository);

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();

    users = await _userRepository.getAll();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    await _userRepository.insert(user);
    await fetchUsers();
  }

  Future<void> updateUser(User user, int id) async {
    await _userRepository.update(user, id);
    await fetchUsers();
  }

  Future<void> deleteUser(int id) async {
    await _userRepository.delete(id);
    await fetchUsers();
  }
}
