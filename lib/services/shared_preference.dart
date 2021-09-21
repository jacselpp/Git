import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  late SharedPreferences _preference;
  static final SharedPreference _instance = SharedPreference._internal();

  factory SharedPreference() => _instance;
  SharedPreference._internal();

  Future<void> initialize() async =>
      _preference = await SharedPreferences.getInstance();

  // Token: ------------------------------------------------------
  String? get readToken => _preference.getString('TOKEN');
  void saveToken(String token) => _preference.setString('TOKEN', token);
  void deleteToken() => _preference.remove('TOKEN');

  // AppToken: ------------------------------------------------------
  String? get readAppToken => _preference.getString('APP_TOKEN');
  void saveAppToken(String token) => _preference.setString('APP_TOKEN', token);
  void deleteAppToken() => _preference.remove('APP_TOKEN');

  // Theme: ------------------------------------------------------
  bool? get getDarkMode => _preference.getBool('isDark');
  void setDarkMode(bool value) => _preference.setBool('isDark', value);

  // FirstTime: ------------------------------------------------------
  bool? get getIsNotFirstTime => _preference.getBool('FirstTime');
  void setIsNotFirstTime(bool value) => _preference.setBool('FirstTime', value);
}
