class User {
  String? username;
  String? password;

  User({this.username, this.password});
  User.fromMap(dynamic obj) {
    username = obj['Username'];
    password = obj['Password'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['Username'] = username;
    map['Password'] = password;
    return map;
  }
}
