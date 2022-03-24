import 'package:flutter/foundation.dart';
import 'package:pr1/models/database_helper.dart';
import '../models/school.dart';
import 'package:flutter/material.dart';

class SchoolProvider with ChangeNotifier {
  List<School> _items = [];

  List<School> get items {
    return [..._items];
  }

  Future<void> fetchSchools() async {
    final schoolslist = await DBHelper.getData('Schools');
    _items = schoolslist
        .map((e) => School(
            name: e['Name'],
            city: e['City'],
            location: e['Location'],
            rate: e['Rate'],
            category: e['Category'],
            studylevel: e['Study_Level'],
            geoLocation: e['GeoLocation'],
            image: e['image']))
        .toList();
    notifyListeners();
  }

  Future<void> addNewSchool(School school) async {
    final db = await DBHelper.database();
    final newSchool = School(
        name: school.name,
        city: school.city,
        location: school.location,
        category: school.category,
        rate: school.rate,
        studylevel: school.studylevel);
    db.rawQuery(
        'insert into Schools (Name,City,Location,Rate,Category,Study_Level) values (\'${newSchool.name}\',\'${newSchool.city}\',\'${newSchool.location}\',${school.rate},\'${newSchool.category}\',\'${newSchool.studylevel}\');');
    notifyListeners();
  }

  Future<void> deleteSchool(School school) async {
    _items.removeWhere((element) => element.name == school.name);
    items;
    // ignore: unused_local_variable
    final db = DBHelper.deleteSchool('Schools', school.name);
    notifyListeners();
  }

  static Future<List<School>> searchSchool(
    String keyword,
  ) async {
    final db = await DBHelper.database();
    List<Map<String, dynamic>> allRows = await db
        .query('Schools', where: 'Name Like ? ', whereArgs: ['%$keyword%']);
    List<School> schools = allRows.map((e) => School.fromMap(e)).toList();
    return schools;
  }

  static Future<List<School>> advancedsearchSchool(String location, String city,
      String rate, String category, String studylevel) async {
    final db = await DBHelper.database();
    List<Map<String, dynamic>> allRows = await db.query('Schools',
        where:
            'Location Like ? and City like ? and Rate = ? and Category = ? and Study_Level = ?',
        whereArgs: [
          '%$location%',
          '%$city%',
          // ignore: unnecessary_string_interpolations
          '$rate',
          // ignore: unnecessary_string_interpolations
          '$category',
          // ignore: unnecessary_string_interpolations
          '$studylevel'
        ]);
    List<School> schools = allRows.map((e) => School.fromMap(e)).toList();
    return schools;
  }

  static Future<List<School>> getallSchools() async {
    final db = await DBHelper.database();
    List<Map<String, dynamic>> allRows = await db.query(
      'Schools',
    );
    List<School> schools = allRows.map((e) => School.fromMap(e)).toList();
    return schools;
  }
}
