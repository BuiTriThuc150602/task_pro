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

  // login by username and password
  Future<User?> login(String username, String password) async {
    final rs = await database.rawQuery(
      'SELECT * FROM $tableName WHERE username = ? AND password = ?',
      [username, password],
    );

    if (rs.isNotEmpty) {
      return User.fromJson(rs.first);
    } else {
      return null;
    }
  }
}
