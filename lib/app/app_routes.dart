import 'package:detooo_recargas/ui/views/auth/login_view.dart';
import 'package:detooo_recargas/ui/views/home/home_view.dart';
import 'package:detooo_recargas/ui/views/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  //! AUTH ROUTES
  static const String SPLASH = 'splash';
  static const String LOGIN = 'login';

  //!Home Views
  static const String HOME = 'home';

  static Route<dynamic>? appRoutes(RouteSettings settings) {
    switch (settings.name) {
      //! AUTH ROUTES
      case SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case HOME:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
