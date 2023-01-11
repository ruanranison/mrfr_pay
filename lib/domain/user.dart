class User {
  late String username;
  late String password;
  late String city;

  User({required this.username, required this.password, required this.city});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['password'] = password;
    data['city'] = city;
    return data;
  }
}
