import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/utils/routes.dart';

class UserRepository {
  void logout() {
    SharedPreference.deleteUserKey;
    NavigatorProvider().navigatorKeyState.pushReplacementNamed(Routes.LOGIN);
  }
}
