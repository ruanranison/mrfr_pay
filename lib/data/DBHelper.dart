import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "boleto.db");

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100), city varchar(100))";
    await db.execute(sql);

    sql =
        "CREATE TABLE boleto (nome varchar(100), valor varchar(20), codigo varchar(20) PRIMARY KEY, vencimento DATE)";
    await db.execute(sql);

    sql =
        "CREATE TABLE extrato (nome varchar(100), valor varchar(20), codigo varchar(20) PRIMARY KEY, vencimento DATE)";
    await db.execute(sql);
  }
}
