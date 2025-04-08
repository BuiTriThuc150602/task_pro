import 'package:get_it/get_it.dart';
import 'package:task_your_life/repositories/subtask_repository.dart';
import 'package:task_your_life/repositories/task_repository.dart';
import 'package:task_your_life/repositories/user_repository.dart';
import 'package:task_your_life/services/database_service.dart';
import 'package:task_your_life/services/subtask_service.dart';
import 'package:task_your_life/services/task_service.dart';
import 'package:task_your_life/services/user_service.dart';
import 'package:task_your_life/view_models/auth_view_model.dart';
import 'package:task_your_life/view_models/subtask_view_model.dart';
import 'package:task_your_life/view_models/task_view_model.dart';
import 'package:task_your_life/view_models/user_view_model.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector() async {
  // Database
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());

  // Services
  getIt.registerLazySingleton<UserService>(() => UserService());
  getIt.registerLazySingleton<TaskService>(() => TaskService());
  getIt.registerLazySingleton<SubTaskService>(() => SubTaskService());

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(getIt<UserService>()));
  getIt.registerLazySingleton<TaskRepository>(
      () => TaskRepository(getIt<TaskService>()));
  getIt.registerLazySingleton<SubTaskRepository>(
      () => SubTaskRepository(getIt<SubTaskService>()));

  // ViewModels
  getIt.registerFactory<UserViewModel>(
      () => UserViewModel(getIt<UserRepository>()));
  getIt.registerFactory<TaskViewModel>(
      () => TaskViewModel(getIt<TaskRepository>()));
  getIt.registerFactory<SubTaskViewModel>(
      () => SubTaskViewModel(getIt<SubTaskRepository>()));
  getIt.registerFactory<AuthViewModel>(
      () => AuthViewModel(getIt<UserRepository>()));
}
