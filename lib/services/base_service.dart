import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';
import '../services/database_service.dart';

typedef FromMap<T> = T Function(Map<String, dynamic> map);
typedef ToMap<T> = Map<String, dynamic> Function(T object);

class BaseService<T> {
  final String tableName;
  final FromMap<T> fromMap;
  final ToMap<T> toMap;

  final DatabaseService _databaseService = GetIt.instance<DatabaseService>();

  BaseService(
      {required this.tableName, required this.fromMap, required this.toMap});

  Future<Database> get _db async => await _databaseService.database;

  Future<int> insert(T object) async {
    final db = await _db;
    return await db.insert(tableName, toMap(object));
  }

  Future<int> update(T object, int id) async {
    final db = await _db;
    return await db.update(
      tableName,
      toMap(object),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await _db;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<T>> getAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((map) => fromMap(map)).toList();
  }

  Future<T?> getById(int id) async {
    final db = await _db;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return fromMap(maps.first);
    } else {
      return null;
    }
  }
}
