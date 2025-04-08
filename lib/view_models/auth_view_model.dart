import 'package:flutter/material.dart';
import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  AuthViewModel(this._userRepository);

  Future<bool> login(String username, String password) async {
    try {
      final users = await _userRepository.getAll();
      final user = users.firstWhere(
        (u) => u.username == username && u.password == password,
        orElse: () => throw Exception('User not found or password incorrect'),
      );

      _currentUser = user;
      notifyListeners();
      return true;
    } catch (e) {
      print('Login failed: $e');
      return false;
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
