import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_your_life/common/constants/db_constants.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbConstants.dbName);
    return await openDatabase(
      path,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DbConstants.userTable);
    await db.execute(DbConstants.taskTable);
    await db.execute(DbConstants.subTaskTable);
  }
}
