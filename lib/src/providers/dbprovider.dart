import 'dart:io';

import 'package:gymobile/src/models/measures_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'gym.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Measures(
          id  INTEGER PRIMARY KEY,
          weight TEXT,          
          chest TEXT,
          arm TEXT,
          shoulders TEXT,
          leg TEXT,
          calf TEXT
        )      
      ''');
    });
  }

  Future<int> insert(Measures newElement) async {
    final db = await database;
    final newId = await db.insert('Measures', newElement.toJson());
    return newId;
  }

  Future<dynamic> list() async {
    final db = await database;
    final result = await db.query('Measures');
    return result.isNotEmpty
        ? result.map((t) => Measures.fromJson(t)).toList()
        : [];
  }
}