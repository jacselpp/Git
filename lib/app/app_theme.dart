import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.blue[50],
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
    iconTheme: const IconThemeData(color: Colors.black),
    cardTheme: const CardTheme(shadowColor: primaryColor),
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
    scaffoldBackgroundColor: const Color(0XFF1C2025),
    cardColor: const Color(0XFF282c34),
    cardTheme: const CardTheme(
      shadowColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
    ),
  );
}
