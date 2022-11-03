import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "boleto.db");

    Database db = await openDatabase(dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }



  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = "CREATE TABLE boleto (nome varchar(100), valor double, codigo varchar(20)) PRIMARY KEY";
    await db.execute(sql);
  }

}