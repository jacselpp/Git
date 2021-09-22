import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/utils/dismiss_keyboard.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: DismissKeyboard(child: child),
    );
  }
}
