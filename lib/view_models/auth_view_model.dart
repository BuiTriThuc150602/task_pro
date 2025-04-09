import 'package:flutter/material.dart';
import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  User? _currentUser;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  AuthViewModel(this._userRepository);

  Future<bool> login(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      final user = await _userRepository.login(username, password);
      _currentUser = user;
      _isLoading = false;
      notifyListeners();
      return user != null;
    } catch (e) {
      print('Login failed: $e');
      _isLoading = false;
      notifyListeners();
    }
    return _currentUser != null;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
