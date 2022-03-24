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
          'Create TABLE Schools (id INTEGER PRIMARY KEY,Name TEXT,City TEXT, Location TEXT,Rate TEXT,Category TEXT,Study_Level TEXT, GeoLocation TEXT NULL,image TEXT NULL)');
      await db.execute(
          'Insert into Users (Username,Password) values(\'admin\' , \'ad123\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Jawdat Al-Hashmi\',\'Damascus\',\'(Tajheez - Mohafaza)\',\'3\',\'Public School\',\'High School\',\'Jawdat_Al-Hashmi\',\'https://www.google.com/maps/place/Jawdat+Al+Hashmi/@33.5157258,36.2907156,16.65z/data=!4m5!3m4!1s0x1518e7317db1bf47:0xc28e0b7060b5ee36!8m2!3d33.5154247!4d36.2921442\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Al-Bohtori \',\'Damascus\',\'(Damascus - Dummar)\',\'5\',\'Private School\',\'High School\',\'Al-Bohtori_School\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%A7%D9%84%D8%A8%D8%AD%D8%AA%D8%B1%D9%8A%E2%80%AD/@33.5389903,36.2465579,17.99z/data=!4m12!1m6!3m5!1s0x1518dda35028c959:0xdccfe2162e19ced1!2z2YXYr9ix2LPYqSDYp9mE2KjYrdiq2LHZig!8m2!3d33.5391515!4d36.2465743!3m4!1s0x1518dda35028c959:0xdccfe2162e19ced1!8m2!3d33.5391515!4d36.2465743\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Ghassan Ibrahim\',\'Homs\',\'(Wadi Aldahab - alwrood Neighborhood) \',\'3\',\'Public School\',\'basic education\',\'Ghassan_Ibrahim\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%BA%D8%B3%D8%A7%D9%86+%D8%A7%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85%E2%80%AD/@34.7012117,36.7306376,17z/data=!4m5!3m4!1s0x15230f440b65555b:0xd1142ff1483b1d62!8m2!3d34.7012117!4d36.7328263\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Nzaem Al-Atrash\',\'Homs\',\'(Homs - New Akrama)\',\'3\',\'Public School\',\'primary education\',\'Nzaem_Alatrash\',\'https://www.google.com/maps/place/Nazim+al-Atrash+School/@34.707816,36.7126998,17z/data=!4m12!1m6!3m5!1s0x15230f22dd9dd281:0x82e888f359b83020!2sNazim+al-Atrash+School!8m2!3d34.707816!4d36.7147612!3m4!1s0x15230f22dd9dd281:0x82e888f359b83020!8m2!3d34.707816!4d36.7147612\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'AL-Resala\',\'Homs\',\'(Homs - Maskana)\',\'5\',\'Private School\',\'High School\',\'Al-Resala\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%A7%D9%84%D8%B1%D8%B3%D8%A7%D9%84%D8%A9%E2%80%AD/@34.6706196,36.7440225,17.52z/data=!4m12!1m6!3m5!1s0x15230f00b3ca0053:0x794eb801f196a88e!2z2YXYr9ix2LPYqSDYp9mE2LHYs9in2YTYqQ!8m2!3d34.6715358!4d36.7450153!3m4!1s0x15230f00b3ca0053:0x794eb801f196a88e!8m2!3d34.6715358!4d36.7450153\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Ghurnata\',\'Homs\',\'(Homs - Mousili)\',\'4\',\'Public School\',\'High School\',\'Ghurnata\',\'https://www.google.com/maps/place/Granada+High+School/@34.7340655,36.7013955,17z/data=!4m12!1m6!3m5!1s0x15230eced740eaab:0x74e7576b58612482!2sGranada+High+School!8m2!3d34.7340505!4d36.703449!3m4!1s0x15230eced740eaab:0x74e7576b58612482!8m2!3d34.7340505!4d36.703449\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'مدرسة الأوائل للبنات\',\'Damascus\',\'(Damascus - Moadamiat alsham)\',\'5\',\'Private School\',\'High School\',\'Al-Awael\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%A7%D9%84%D8%A7%D9%88%D8%A7%D8%A6%D9%84+%D8%A7%D9%84%D9%86%D9%85%D9%88%D8%B0%D8%AC%D9%8A%D8%A9%E2%80%AD/@33.4532778,36.1686937,15z/data=!4m9!1m2!2m1!1z2YXYr9ix2LPYqSDYp9mE2KPZiNin2KbZhA!3m5!1s0x151927c08ba999cd:0x1362bc8a2a86c361!8m2!3d33.4552829!4d36.1750881!15sChnZhdiv2LHYs9ipINin2YTYo9mI2KfYptmEkgEGc2Nob29s\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'مدرسة المحسنية\',\'Damascus\',\'(Damascus - Modhat Basha)\',\'4\',\'Private School\',\'High School\',\'Al-Mohasnia\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%A7%D9%84%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%AD%D8%B3%D9%86%D9%8A%D8%A9+%D9%84%D9%84%D8%A8%D9%86%D9%8A%D9%86%E2%80%AD/@33.5091795,36.3078769,17.52z/data=!4m12!1m6!3m5!1s0x1518e6d4295c29a9:0x1e719eb36a58fd5e!2z2YXYr9ix2LPYqSDYp9mE2KvYp9mG2YjZitipINin2YTZhdit2LPZhtmK2Kkg2YTZhNio2YbZitmG!8m2!3d33.5091074!4d36.3094474!3m4!1s0x1518e6d4295c29a9:0x1e719eb36a58fd5e!8m2!3d33.5091074!4d36.3094474\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Al-Saada\',\'Damascus\',\'(Damascus - Kanawat)\',\'5\',\'Private School\',\'High School\',\'Al-Saada\',\'https://www.google.com/maps/place/Alsaade+Private+School/@33.5095145,36.2960128,17z/data=!4m12!1m6!3m5!1s0x1518e72d206c8191:0x23638a855b2ce089!2sAlsaade+Private+School!8m2!3d33.5094227!4d36.2982061!3m4!1s0x1518e72d206c8191:0x23638a855b2ce089!8m2!3d33.5094227!4d36.2982061\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'دار السلام\',\'Damascus\',\'(Damascus - Shaalan)\',\'5\',\'Private School\',\'High School\',\'Dar_Al-salam\',\'https://www.google.com/maps/place/Dar+El+Salam+School/@33.5168201,36.288075,17z/data=!4m12!1m6!3m5!1s0x1518e736b6f69b69:0x1e173c053b96b3cf!2sDar+El+Salam+School!8m2!3d33.5168201!4d36.2902637!3m4!1s0x1518e736b6f69b69:0x1e173c053b96b3cf!8m2!3d33.5168201!4d36.2902637\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'مدرسة الغد المشرق\',\'Damascus\',\'(Damascus - Maysat)\',\'4\',\'Private School\',\'basic education\',\'Al-Ghad_Al-Moshrek\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%A7%D9%84%D8%BA%D8%AF+%D8%A7%D9%84%D9%85%D8%B4%D8%B1%D9%82%E2%80%AD/@33.5324145,36.2906007,17z/data=!4m12!1m6!3m5!1s0x1518e702966b7037:0xe7258193c7e37bcf!2z2YXYr9ix2LPYqSDYp9mE2LrYryDYp9mE2YXYtNix2YI!8m2!3d33.5324145!4d36.2927894!3m4!1s0x1518e702966b7037:0xe7258193c7e37bcf!8m2!3d33.5324145!4d36.2927894\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'عبد الحميد الزهراوي\',\'Homs\',\'(Homs - Bassek Hafez Al Assad)\',\'3\',\'Public School\',\'High School\',\'Al-Zahrawi\',\'https://www.google.com/maps/place/Abd+El+Hamid+Al-Zahrawi+High+School/@34.7265325,36.6981668,17z/data=!4m12!1m6!3m5!1s0x15230ed3fa77c3b1:0x343fb079265446c8!2sAbd+El+Hamid+Al-Zahrawi+High+School!8m2!3d34.7265325!4d36.7003555!3m4!1s0x15230ed3fa77c3b1:0x343fb079265446c8!8m2!3d34.7265325!4d36.7003555\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Al-Maamoun\',\'Aleppo\',\'(Aleppo - Al-Qudsy Street)\',\'4\',\'Public School\',\'High School\',\'Al-Maamoun\',\'https://www.google.com/maps/place/%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%A3%D9%85%D9%88%D9%86%E2%80%AD/@36.2036635,37.1400815,17z/data=!4m12!1m6!3m5!1s0x152ff80dfc9e3f45:0x432b5951c70627d7!2z2KvYp9mG2YjZitipINin2YTZhdij2YXZiNmG!8m2!3d36.2036635!4d37.1422702!3m4!1s0x152ff80dfc9e3f45:0x432b5951c70627d7!8m2!3d36.2036635!4d37.1422702\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Al-Maali\',\'Aleppo\',\'(Aleppo - Shahbaa)\',\'5\',\'Private School\',\'primary education\',\'Al-Maali\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D9%84%D9%8A+%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9+%D8%B4%D9%87%D8%A8%D8%A7%D8%A1%E2%80%AD/@36.2160151,37.1164788,17z/data=!4m12!1m6!3m5!1s0x152ff7f11300f105:0xac5429b51c41379a!2z2YXYr9ix2LPYqSDYp9mE2YXYudin2YTZiiDYp9mE2K7Yp9i12Kkg2LTZh9io2KfYoQ!8m2!3d36.216006!4d37.1188139!3m4!1s0x152ff7f11300f105:0xac5429b51c41379a!8m2!3d36.216006!4d37.1188139\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'طارق بن زياد\',\'Aleppo\',\'(Aleppo - Ashrafiyye)\',\'4\',\'Public School\',\'primary education\',\'Tarek_Bin_Ziad\',\'https://www.google.com/maps/place/Tareq+Bin+Ziad+School,+Aleppo,+Syria/@36.2202374,37.1335799,17z/data=!4m13!1m7!3m6!1s0x152ff8235a299531:0x31fcb166511713f!2sTareq+Bin+Ziad+School,+Aleppo,+Syria!3b1!8m2!3d36.2202943!4d37.1358266!3m4!1s0x152ff8235a299531:0x31fcb166511713f!8m2!3d36.2202943!4d37.1358266\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Elementary\',\'Aleppo\',\'(Aleppo - Al-Wehda)\',\'5\',\'Private School\',\'High School\',\'Elementary\',\'https://www.google.com/maps/place/Elementary+School+modellers/@36.2207178,37.1190413,16.48z/data=!4m12!1m6!3m5!1s0x152ff7f357b7026f:0x9ce6c44c3fb1f380!2sElementary+School+modellers!8m2!3d36.2207806!4d37.1203404!3m4!1s0x152ff7f357b7026f:0x9ce6c44c3fb1f380!8m2!3d36.2207806!4d37.1203404\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'صالح العلي\',\'Aleppo\',\'(Aleppo - Ashrafiyye)\',\'4\',\'Public School\',\'High School\',\'Saleh_Al-Ali\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%B5%D8%A7%D9%84%D8%AD+%D8%A7%D9%84%D8%B9%D9%84%D9%8A%E2%80%AD/@36.2330099,37.1380044,16.74z/data=!4m12!1m6!3m5!1s0x152ff96c7263e23b:0xb71e1751dd34181f!2z2YXYr9ix2LPYqSDYtdin2YTYrSDYp9mE2LnZhNmK!8m2!3d36.2331415!4d37.1396327!3m4!1s0x152ff96c7263e23b:0xb71e1751dd34181f!8m2!3d36.2331415!4d37.1396327\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Franciscan Missionaries of Mary\',\'Aleppo\',\'(Aleppo - Alrazi)\',\'5\',\'Private School\',\'primary education\',\'Franciscan_Missionaries\',\'https://www.google.com/maps/place/Franciscan+Missionaries+of+Mary/@36.212886,37.1385575,17z/data=!4m5!3m4!1s0x152ff984ec16ebe5:0xcb7b763208dd1784!8m2!3d36.2142412!4d37.1381917\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Nablus\',\'Aleppo\',\'(Aleppo - Rawda)\',\'3\',\'Public School\',\'High School\',\'Nablus\',\'https://www.google.com/maps/place/Nablus+High+School/@36.2150935,37.1258369,17.52z/data=!4m12!1m6!3m5!1s0x152ff81e12037de7:0x29d596cf6358fbfa!2sNablus+High+School!8m2!3d36.2149778!4d37.1268851!3m4!1s0x152ff81e12037de7:0x29d596cf6358fbfa!8m2!3d36.2149778!4d37.1268851\')');
      await db.execute(
          'Insert into Schools (Name,City,Location,Rate,Category,Study_Level,image,GeoLocation) values (\'Sina \',\'Aleppo\',\'(Aleppo - new Aleppo)\',\'5\',\'Private School\',\'High School\',\'Sina\',\'https://www.google.com/maps/place/%D9%85%D8%AF%D8%B1%D8%B3%D8%A9+%D8%B3%D9%8A%D9%86%D8%A7+%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9%E2%80%AD/@36.2099175,37.107513,14.66z/data=!4m12!1m6!3m5!1s0x152ff7c067f06e29:0xb9d34786d1d8068c!2z2YXYr9ix2LPYqSDYs9mK2YbYpyDYp9mE2K7Yp9i12Kk!8m2!3d36.2061202!4d37.1189953!3m4!1s0x152ff7c067f06e29:0xb9d34786d1d8068c!8m2!3d36.2061202!4d37.1189953\')');
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
      // ignore: empty_catches
    } catch (e) {}
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

  // static Future<void> getTables() async {
  //   final db = await DBHelper.database();
  //   final tabels = db
  //       .rawQuery(
  //           'update Schools set image = \'Jawdat_Al-Hashmi\' where name like \'%jawdat%\' ')
  //       .then((value) => print(value));
  // }
}
