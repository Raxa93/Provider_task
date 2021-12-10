// ignore_for_file: prefer_const_declarations, missing_return, unused_import, avoid_print, prefer_is_empty

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:provider_apisql/Model/User.dart';
import 'package:provider_apisql/Model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'user_services.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static final _dbName = 'Countries.db';
  static final _tableName = 'CountryTable';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnusername = 'username';
  // static final columnemail = 'email';
  // static final columnaddress = 'address';
  // static final columnphone = 'phone';
  // static final columnwebsite = 'website';
  // static final columnCompany = 'company';

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      print('database exists');
      return _db;
    }
    _db = await initDatabase();
    print('object');
    return _db;
  }

  initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, _dbName);
    var db = await openDatabase(path, version: 3, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_tableName($columnId TEXT,$columnName TEXT,$columnusername TEXT)');
    print("Table $_tableName Created!!");
  }

  // Future<int> add(User user) async {
  //   print(user.name);
  //   print('data addition function');
  //   Database db = await instance.db;
  //   return await db.insert(_tableName, user.toMap());
  // }

  Future<List<User>> checkDb() async {
    print('function called');
    var dbClient = await db;
    List<Map> maps = await dbClient.query('CountryTable', columns: [
      'id',
      'name',
      'username'
    ]);
    print('I am the Users: $maps}');
    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        print('functioncalled for');
        users.add(User.fromJson(maps[i]));
        print(maps[i]);
      }
    }
    else{
      print('No data');
    }
   
    return users;
  }
}
