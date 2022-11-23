import 'package:flutter/cupertino.dart';
import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:sqflite/sqlite_api.dart';

class BoletoDao {
  Future<List<Boleto>> pegarBoletoBD() async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();
    String sql = "SELECT * FROM boleto";
    List<Boleto> listaBoleto = [];
    var result = await database.rawQuery(sql);
    for (var json in result) {
      Boleto boleto = Boleto.fromJson(json);
      listaBoleto.add(boleto);
    }
    print(result);
    return listaBoleto;
  }

  cadastrarBoleto({required Boleto boleto}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.insert('boleto', boleto.toJson());
  }

  deletarBoleto({required Boleto boleto}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.rawDelete('DELETE FROM boleto WHERE codigo = ?',[boleto.codigo],);
  }
}