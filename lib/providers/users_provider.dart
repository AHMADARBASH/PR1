import 'package:flutter/cupertino.dart';
import 'package:pr1/models/user.dart';
import '../models/database_helper.dart';

class UserProvider with ChangeNotifier {
  List<User> _items = [];

  List<User> get items {
    return [..._items];
  }

  Future<void> fetchUsers() async {
    final userslist = await DBHelper.getData('Users');
    _items = userslist
        .map((e) => User(username: e['Username'], password: e['Password']))
        .toList();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    _items.add(user);
  }

  Future<void> deleteUser(User user) async {
    _items.removeWhere((element) => element.username == user.username);
    items;
    final db = DBHelper.deleteUser('Users', user.username);
    notifyListeners();
  }

  void refreshData() {
    notifyListeners();
  }
}
