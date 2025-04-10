import 'package:flutter/material.dart';
import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  List<User> _users = [];
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = '';
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;

  UserViewModel(this._userRepository);

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    await _userRepository.getAll().then((result) {
      result.fold(
        (usersList) {
          _users = usersList;

          _isError = false;
          _errorMessage = '';
        },
        (error) {
          _isError = true;
          _errorMessage = error.toString();
          _users = [];
        },
      );
    });
    _isLoading = false;
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
