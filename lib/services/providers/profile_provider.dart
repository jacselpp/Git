import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  Profile? _profile;

  Profile? get profile {
    if (_profile == null) {
      _fetchProfile();
    }
    return _profile;
  }

  void _fetchProfile() {
    Profile? profile = SharedPreference.profile;
    if (profile == null) {
      APIUsers.common().profile().then((value) {
        setProfile(value);
      }).catchError((e) {});
    } else {
      setProfile(profile);
    }
  }

  void setProfile(Profile value) {
    _profile = value;
    SharedPreference.setProfile(value);
    notifyListeners();
  }
}
