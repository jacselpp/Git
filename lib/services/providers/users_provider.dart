import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Profile?> _users = [];

  List<Profile?> get getUsers => _users;

  void fetchUser(String id) async {
    List<Profile>? _usersDb = SharedPreference.users;

    if (_usersDb != null) {
      insertUser(_usersDb);
    }

    await APIUsers.common().fetchUserById(id).then((value) {
      insertUser(value);
    }).catchError((e) => HandleError.logError(null, e));
  }

  void insertUser(List<Profile> value) {
    _users = value;
    SharedPreference.setUsers(value);

    notifyListeners();
  }
}
