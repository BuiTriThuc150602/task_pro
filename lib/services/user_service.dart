import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:task_your_life/common/exceptions/app_exception.dart';
import 'package:task_your_life/main.dart';
import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/services/base_service.dart';

class UserService extends BaseService<User> {
  UserService()
      : super(
          tableName: 'users',
          fromMap: (map) => User.fromJson(map),
          toMap: (user) => user.toJson(),
        );

  Future<Result<User>> login(String username, String password) async {
    try {
      final rs = await database.rawQuery(
        'SELECT * FROM $tableName WHERE username = ? AND password = ?',
        [username, password],
      );

      if (rs.isNotEmpty) {
        return Success(User.fromJson(rs.first));
      } else {
        return Failure(
          AppException(
            message: 'Invalid username or password',
            code: 'INVALID_CREDENTIALS',
          ),
        );
      }
    } catch (e) {
      debugPrint('Error in login: $e');
      return Failure(
          AppException(message: 'Failed to login', code: 'LOGIN_ERROR'));
    }
  }
}
