import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      // _db = await openDatabase('tasks.db');
    } else {
      try {
        String path = '${await getDatabasesPath()}tasks.db';
        _db = await openDatabase(
          path,
          version: _version,
          onCreate: (db, version) {
            return db.execute(
              'CREATE TABLE $_tableName('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'title STRING,'
              'note TEXT,'
              'date STRING,'
              'startTime STRING,'
              'endTime STRING,'
              'repeat STRING,'
              'color INTEGER,'
              'isCompleted INTEGER,'
              'remind INTEGER)',
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task task) async {
    print("inserting");
    return await _db!.insert(_tableName, task.toJson());
  }

  static Future<int> delete(int id) async {
    return await _db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> query() async{
    return await _db!.query(_tableName);
  }

  static Future<int> update(Task task) async{
    return await _db!.update(
      _tableName,
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<void> deleteAll() async{
    await _db!.delete(_tableName);
  }
}
