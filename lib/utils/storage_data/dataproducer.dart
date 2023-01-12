/*import 'dart:async';

import 'package:fatura_app/models/producer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
class SQLdb {
  // DatabaseHelper._privateConstructor();
  //static final DatabaseHelper instance= DatabaseHelper._privateConstructor();

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initiateDB();
      return _db;
    } else {
      return _db;
    }
  }

  initiateDB() async {
   io.Directory documentDirectory =await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'zifatura.db');
    Database mydb = await openDatabase(path,
        version: 12, onCreate: _onCreate, onUpgrade: _onUpgreade);
    return mydb;
  }

  _onUpgreade(Database db, int oldversion, int newversion) {

    print("onupgrag=======================================");
  }

  _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "myProducer" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "namep" TEXT NOT NULL,
  "price" INTEGER NOT NULL,
  "qty" INTEGER NOT NULL
)
    ''');

  }
  Future<modalProducer> insert(modalProducer modelPro)async{
    var dbClient =await db;
    await dbClient?.insert('myProducer', modelPro.toMap());
    return modelPro;
  }
  Future<modalProducer> 
  }*/