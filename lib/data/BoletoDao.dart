import 'package:flutter/cupertino.dart';
import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:sqflite/sqlite_api.dart';

class BoletoDao {
  Future<List<Boleto>> pegarBoletoBD() async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();
    String sql = "SELECT * FROM boleto";
    var result = await database.rawQuery(sql);
    print(result);
    List<Boleto> lista = pegarListaBoleto(result);
    return lista;
  }

  List<Boleto> pegarListaBoleto(List<Map<String, dynamic>> result) {
    List<Boleto> listaBoleto = [];
    result.forEach((element) {
      Boleto boleto = Boleto.fromJson(element);
      listaBoleto.add(boleto);
    });
    return listaBoleto;
  }

  cadastrarBoleto({required Boleto boleto}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.insert('user', boleto.toJson());
  }
}

getListaBoleto() async {
  List<Boleto> lista = await BoletoDao().pegarBoletoBD();
  return lista;
}
