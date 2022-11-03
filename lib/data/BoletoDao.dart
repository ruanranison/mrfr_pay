import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:sqflite/sqlite_api.dart';

class BoletoDao {
  Future<List<Map>> pegarBoletoBD() async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    String sql = "SELECT * FROM boleto";
    List<Map<String, dynamic>> result = await database.rawQuery(sql);
    return result;
  }

  List<Boleto> pegarListaBoleto() {
    List<Map<String, dynamic>> result = pegarBoletoBD();
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
