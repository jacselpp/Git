import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Profile>? _users;

  Profile? getProfile(String id) {
    return _users!.firstWhere((element) => element.id == id);
  }

  void fetchUser(String id) async {
    await APIUsers.common().fetchUserById(id).then((value) {
      insertUser(value);
    });
  }

  void insertUser(List<Profile> value) {
    _users = value;
    notifyListeners();
  }
}
