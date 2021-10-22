import 'package:detooo_recargas/services/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/services/providers/countries_provider.dart';
import 'package:detooo_recargas/services/providers/language_provider.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';
import 'package:detooo_recargas/services/providers/testimonials_provider.dart';
import 'package:detooo_recargas/services/providers/users_provider.dart';
import 'package:detooo_recargas/utils/dismiss_keyboard.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountriesProvider>(
          create: (context) => CountriesProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider<UsersProvider>(
          create: (context) => UsersProvider(),
        ),
        ChangeNotifierProvider<TestimonialsProvider>(
          create: (context) => TestimonialsProvider(),
        ),
        ChangeNotifierProvider<PackagesProvider>(
          create: (context) => PackagesProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: DismissKeyboard(child: child),
    );
  }
}
