import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';
import 'package:task_your_life/common/exceptions/app_exception.dart';
import '../services/database_service.dart';

typedef FromMap<T> = T Function(Map<String, dynamic> map);
typedef ToMap<T> = Map<String, dynamic> Function(T object);

class BaseService<T extends Object> {
  final String tableName;
  final FromMap<T> fromMap;
  final ToMap<T> toMap;
  final DatabaseService _databaseService = GetIt.instance<DatabaseService>();

  BaseService({
    required this.tableName,
    required this.fromMap,
    required this.toMap,
  });

  Future<Database> get _db async => await _databaseService.database;

  Future<Result<int>> insert(T object) async {
    try {
      final db = await _db;
      final id = await db.insert(tableName, toMap(object));
      return Success(id);
    } catch (e) {
      debugPrint('Error in insert: $e');
      return Failure(
          AppException(message: 'Failed to insert item', code: 'INSERT_ERROR'));
    }
  }

  Future<Result<int>> update(T object, int id) async {
    try {
      final db = await _db;
      final count = await db.update(
        tableName,
        toMap(object),
        where: 'id = ?',
        whereArgs: [id],
      );
      return Success(count);
    } catch (e) {
      debugPrint('Error in update: $e');
      return Failure(AppException(
          message: 'Failed to update item with id $id : $e',
          code: 'UPDATE_ERROR'));
    }
  }

  Future<Result<int>> delete(int id) async {
    try {
      final db = await _db;
      final count = await db.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return Success(count);
    } catch (e) {
      debugPrint('Error in delete: $e');
      return Failure(AppException(
          message: 'Failed to delete item with id $id : $e',
          code: 'DELETE_ERROR'));
    }
  }

  Future<Result<List<T>>> getAll() async {
    try {
      final db = await _db;
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      final List<T> result = maps.map((map) => fromMap(map)).toList();
      return Success(result);
    } catch (e) {
      debugPrint('Error in getAll: $e');
      return Failure(AppException(
          message: 'Failed to fetch items from $tableName: $e',
          code: 'FETCH_ERROR'));
    }
  }

  Future<Result<T>> getById(int id) async {
    try {
      final db = await _db;
      final List<Map<String, dynamic>> maps = await db.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return Success(fromMap(maps.first));
      } else {
        return Failure(AppException(
            message: 'Item with id $id not found', code: 'NOT_FOUND'));
      }
    } catch (e) {
      debugPrint('Error in getById: $e');
      return Failure(AppException(
          message: 'Failed to fetch item with id $id: $e',
          code: 'FETCH_ERROR'));
    }
  }
}
