import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/domain/user.dart';
import 'package:mrfr_pay/screens/login_screen.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao {
  listarUsers(String usuario, String password) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    String sql = "SELECT * "
        "FROM user "
        "WHERE username = ? "
        "AND password = ?";

    var result = await database.rawQuery(sql, [usuario, password]);
    List<User> userLogado = [];
    for (var json in result) {
      User user = User.fromJson(json);
      userLogado.add(user);
    }
    return userLogado[0].city;
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
