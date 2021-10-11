import 'package:detooo_recargas/services/providers/countries_provider.dart';
import 'package:detooo_recargas/services/providers/municipios_provider.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<ProvinciasProvider>(
          create: (context) => ProvinciasProvider(),
        ),
        ChangeNotifierProvider<MunicipiosProvider>(
          create: (context) => MunicipiosProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: DismissKeyboard(child: child),
    );
  }
}
