import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:task_your_life/app/MyApp.dart';
import 'package:task_your_life/common/injector/injector.dart';
import 'package:task_your_life/repositories/user_repository.dart';
import 'package:task_your_life/services/database_service.dart';
import 'package:task_your_life/view_models/auth_view_model.dart';

late Database database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupInjector();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  openDatabase();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('vi')],
    path: 'assets/translations',
    fallbackLocale: const Locale('vi'),
    child: MultiProvider(
      providers: [
        Provider<UserRepository>(create: (_) => getIt<UserRepository>()),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => getIt<AuthViewModel>(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

void openDatabase() async {
  final dbService = getIt<DatabaseService>();
  database = await dbService.database;
  print("Database opened: ${database.path}");
}
