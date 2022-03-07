import 'package:pr1/models/user.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'Schools.db'),
        singleInstance: true, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Users (id INTEGER PRIMARY KEY,Username TEXT,Password TEXT)');
    }, version: 1);
  }

  static Future<int> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    int result = 0;
    db
        .insert(
          table,
          data,
          conflictAlgorithm: sql.ConflictAlgorithm.abort,
        )
        .then((value) => result = value);
    return result;
  }

  static Future<List<User>> getAllUsers() async {
    final db = await DBHelper.database();
    final List<Map> maps = await db.query('Users');
    return List.generate(maps.length, (i) {
      return User(username: maps[i]['Username'], password: maps[i]['Password']);
    });
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> delete(String table, dynamic data) async {
    final db = await DBHelper.database();
    db.rawQuery('Delete from Users where username like \'%$data%\' ');
  }
}
