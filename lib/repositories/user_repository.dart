import 'package:result_dart/src/types.dart';
import 'package:task_your_life/models/user.dart';
import 'package:task_your_life/services/user_service.dart';
import 'base_repository.dart';

class UserRepository implements BaseRepository<User> {
  final UserService _userService;

  UserRepository(this._userService);

  @override
  Future<Result<List<User>>> getAll() => _userService.getAll();

  @override
  Future<Result<User>> getById(int id) => _userService.getById(id);

  @override
  Future<Result<int>> insert(User item) => _userService.insert(item);

  @override
  Future<Result<int>> update(User item, int id) =>
      _userService.update(item, id);

  @override
  Future<Result<int>> delete(int id) => _userService.delete(id);

  Future<Result<User>> login(String username, String password) async {
    return await _userService.login(username, password);
  }
}
