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
}

String formatDate(String? date) {
  if (date == null) return '';

  List<String> splittedDate = date.split('-');
  String year = splittedDate[0];
  String month = splittedDate[1];
  String day = splittedDate[2];

  if (int.parse(month) < 10) {
    month = "0${int.parse(month)}";
  }
 
  if (int.parse(day) < 10) {
    day = "0${int.parse(day)}";
  }

  return "$day/$month/$year";
}

String formatDateToBD(String date) {
  if (date.contains("/")) {
    List<String> splittedDate = date.split('/');

    String day = splittedDate[0];
    String month = splittedDate[1];
    String year = splittedDate[2];

    return "$year-$month-$day";
  }

  return date;
}