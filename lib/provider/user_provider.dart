import 'package:dst/model/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: uuid.v4(),
    name: '',
    totalhours: 0,
    image: null,
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
