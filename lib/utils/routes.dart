import 'package:flutter/material.dart';

class NavigatorProvider {
  late final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static final NavigatorProvider _instance = NavigatorProvider._internal();

  factory NavigatorProvider() => _instance;
  NavigatorProvider._internal();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  NavigatorState get navigatorKeyState => _navigatorKey.currentState!;
}
