import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/domain/extrato.dart';
import 'package:sqflite/sqlite_api.dart';

class ExtratoDao {
  Future<List<Extrato>> pegarExtratoBD() async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();
    String sql = "SELECT * FROM extrato";
    List<Extrato> listaExtrato = [];
    var result = await database.rawQuery(sql);
    for (var json in result) {
      Extrato extrato = Extrato.fromJson(json);
      listaExtrato.add(extrato);
    }
    print(result);
    return listaExtrato;
  }

  cadastrarExtrato({required Extrato extrato}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.insert('extrato', extrato.toJson());
  }

  deletarExtrato({required Extrato extrato}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.rawDelete('DELETE FROM extrato WHERE codigo = ?',[extrato.codigo],);
  }
}