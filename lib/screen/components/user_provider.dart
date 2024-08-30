import 'package:flutter/material.dart';

class UserModel {
  String? email;
  String? username;

  UserModel({this.email, this.username});
}

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = UserModel(); // Resetting to a new instance of UserModel
    notifyListeners();
  }
}
