import 'package:detooo_recargas/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences _preference;
  static final SharedPreference _instance = SharedPreference._internal();

  static Future initialize() async =>
      _preference = await SharedPreferences.getInstance();

  factory SharedPreference() => _instance;
  SharedPreference._internal();

  static const _appToken = 'APP_TOKEN';
  static const _userKey = 'USER_KEY';
  static const _darkMode = 'DARK_MODE';
  static const _firstTime = 'FIRST_TIME';

  // Token: ------------------------------------------------------
  static String? get readUserKey => _preference.getString(_userKey);
  static Future saveUserKey(String key) async =>
      await _preference.setString(_userKey, key);
  static get deleteUserKey => _preference.remove(_userKey);

  // AppToken: ------------------------------------------------------
  static String? get readAppToken => _preference.getString(_appToken);
  static Future saveAppToken(String token) async =>
      await _preference.setString(_appToken, token);
  static get deleteAppToken => _preference.remove(_appToken);

  // Theme: ------------------------------------------------------
  static ThemeData get getDarkMode {
    if (_preference.getBool(_darkMode) != null &&
        _preference.getBool(_darkMode) == true) {
      return AppTheme().darkTheme;
    }
    return AppTheme().lightTheme;
  }

  static Future setDarkMode(bool value) async =>
      await _preference.setBool(_darkMode, value);
}
