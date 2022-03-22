import 'package:pr1/models/user.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'Schools.db'),
        singleInstance: true, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Users (id INTEGER PRIMARY KEY ,Username TEXT UNIQUE ,Password TEXT)');
      await db.execute(
          'Create TABLE Schools (id INTEGER PRIMARY KEY,Name TEXT,City TEXT, Location TEXT,Rate TEXT,Category TEXT,Study_Level TEXT, GeoLocation TEXT NULL)');
      await db.execute(
          'Insert into Users (Username,Password) values(\'admin\' , \'ad123\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level) values(\'Jawdat Al-Hashmi\' , \'Damascus\', \'Tajheez - Mohafaza\', \'3\', \'Public School\',\'High School\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level) values(\'Satea Al-Hosari\' , \'Damascus\', \'Baghdad Street\', \'4\', \'Public School\',\'High School\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level) values(\'Alawael\' , \'Damascus\', \'Moadamiat AL-Sham\', \'5\', \'Private School\',\'High School\')');
    }, version: 1);
  }

  static Future<int> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    int result = 0;
    try {
      db
          .insert(
            table,
            data,
            conflictAlgorithm: sql.ConflictAlgorithm.rollback,
          )
          .then((value) => result = value);
    } catch (e) {
      print(e);
    }
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

  static Future<void> deleteUser(String table, dynamic data) async {
    final db = await DBHelper.database();
    db.rawQuery('Delete from Users where username like \'%$data%\' ');
  }

  static Future<void> deleteSchool(String table, dynamic data) async {
    final db = await DBHelper.database();
    db.rawQuery('Delete from Schools where Name like \'%$data%\' ');
  }

  Future<void> getTables() async {
    final db = await DBHelper.database();
    final tabels =
        db.rawQuery('select * from schools').then((value) => print(value));
  }
}
