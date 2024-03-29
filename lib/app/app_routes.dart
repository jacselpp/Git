// ignore_for_file: constant_identifier_names

import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:detooo_recargas/ui/views/splash_view.dart';
import 'package:detooo_recargas/ui/views/home/home_view.dart';
import 'package:detooo_recargas/ui/views/auth/login_view.dart';
import 'package:detooo_recargas/ui/views/auth/profile_view.dart';
import 'package:detooo_recargas/ui/views/auth/register_view.dart';
import 'package:detooo_recargas/ui/widgets/profile/tab_security.dart';
import 'package:detooo_recargas/ui/views/auth/forgot_password_view.dart';

class Routes {
  //! AUTH ROUTES
  static const String SPLASH = 'splash';
  static const String LOGIN = 'login';
  static const String REGISTER = 'register';
  static const String PROFILE = 'profile';
  static const String SECURITY = 'security';
  static const String FORGOTPASSWORD = 'forgot_password';

  //!Home Views
  static const String HOME = 'home';

  static Route<dynamic>? appRoutes(RouteSettings settings) {
    switch (settings.name) {
      //! AUTH ROUTES
      case SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case PROFILE:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case SECURITY:
        return MaterialPageRoute(
          builder: (context) => const HomeLayout(
            child: TabSecurity(),
          ),
        );

      // return MaterialPageRoute(builder: (_) => );
      case FORGOTPASSWORD:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      //!Home Views
      case HOME:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
