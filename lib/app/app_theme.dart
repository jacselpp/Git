import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
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
      iconTheme: IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(color: primaryColor),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
    ),
  );
}
