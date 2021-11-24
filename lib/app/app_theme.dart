import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: primaryColor),
      toolbarTextStyle: TextStyle(color: primaryColor),
      titleTextStyle: TextStyle(
        color: primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: const CardTheme(shadowColor: bordersLigth),
    scaffoldBackgroundColor: scaffoldLigth,
    textTheme: TextTheme(
      bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
            color: textTextLigth,
          ),
      bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
            color: textTextLigth,
          ),
      headline4: ThemeData.light().textTheme.headline4!.copyWith(
            color: headlineTextLigth,
          ),
      headline5: ThemeData.light().textTheme.headline5!.copyWith(
            color: headlineTextLigth,
          ),
      headline6: ThemeData.light().textTheme.headline6!.copyWith(
            color: headlineTextLigth,
          ),
      subtitle1: ThemeData.light().textTheme.subtitle1!.copyWith(
            color: headlineTextLigth,
          ),
      subtitle2: ThemeData.light().textTheme.subtitle2!.copyWith(
            color: headlineTextLigth,
          ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 14.0,
        color: primaryColor,
      ),
      hintStyle: TextStyle(
        fontSize: 14.0,
        color: primaryColor,
      ),
    ),
  );

  ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Color(0XFF282c34),
      iconTheme: IconThemeData(color: primaryColor),
      toolbarTextStyle: TextStyle(color: primaryColor),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: scaffoldDark,
    textTheme: TextTheme(
      bodyText1: ThemeData.dark().textTheme.bodyText1!.copyWith(
            color: textTextDark,
          ),
      bodyText2: ThemeData.dark().textTheme.bodyText2!.copyWith(
            color: textTextDark,
          ),
      headline4: ThemeData.dark().textTheme.headline4!.copyWith(
            color: headlineTextDark,
          ),
      headline5: ThemeData.dark().textTheme.headline5!.copyWith(
            color: headlineTextDark,
          ),
      headline6: ThemeData.dark().textTheme.headline6!.copyWith(
            color: headlineTextDark,
          ),
      subtitle1: ThemeData.dark().textTheme.subtitle1!.copyWith(
            color: headlineTextDark,
          ),
      subtitle2: ThemeData.dark().textTheme.subtitle2!.copyWith(
            color: headlineTextDark,
          ),
    ),
    cardColor: const Color(0XFF282c34),
    cardTheme: const CardTheme(
      shadowColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
