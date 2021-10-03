import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(SharedPreference());
}
