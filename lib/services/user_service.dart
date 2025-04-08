import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/services/base_service.dart';

class UserService extends BaseService<User> {
  UserService()
      : super(
          tableName: 'users',
          fromMap: (map) => User.fromJson(map),
          toMap: (user) => user.toJson(),
        );
}
