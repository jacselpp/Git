import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  User? _profile;

  User? get profile {
    if (_profile == null) {
      _fetchProfile();
    }
    return _profile;
  }

  void _fetchProfile() {
    APIUsers.common().profile().then((value) {
      setProfile(value);
    }).catchError((e) {});
  }

  void setProfile(User value) {
    _profile = value;
    notifyListeners();
  }
}
