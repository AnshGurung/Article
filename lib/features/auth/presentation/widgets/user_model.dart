class User {
  User1? user;

  User({this.user});

  User.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User1.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User1 {
  String? email;
  String? username;
  String? password;

  User1({
    this.email,
    this.username,
    this.password,
  });

  User1.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    username = json["username"];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["username"] = username;
    _data['password'] = password;

    return _data;
  }
}
