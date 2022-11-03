import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/domain/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao {

  listarusers() async {

    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    String sql = "SELECT * FROM user";
    var result = await database.rawQuery(sql);

    print(result);

  }
  Future<bool> autenticar(String user, String password) async {

     DBHelper dbHelper = DBHelper();
     Database database = await dbHelper.initDB();

     String sql = "SELECT * "
                  "FROM user "
                  "WHERE username = ? "
                  "AND password = ?";

    var result = await database.rawQuery(sql, [user, password]);

    return result.isNotEmpty;
  }
  cadastrarUser({required User user}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.insert('user', user.toJson());
  }

}