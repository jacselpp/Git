import 'package:flutter/material.dart';

class ScreenHelper {
  double percentage = 1;

  static bool isDarkMode(BuildContext context) =>
      (MediaQuery.of(context).platformBrightness == Brightness.dark);

  static bool isPortrait(BuildContext context) =>
      (MediaQuery.of(context).orientation == Orientation.portrait);

  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenHeightPercentage(context, {percentage}) =>
      screenHeight(context) * percentage;
  static double screenWidthPercentage(context, {percentage}) =>
      screenWidth(context) * percentage;
}