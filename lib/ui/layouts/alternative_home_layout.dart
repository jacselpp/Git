import 'package:flutter/material.dart';

import '../app_ui.dart';

class AlternativeHomeLayout extends StatelessWidget {
  final Widget child;

  const AlternativeHomeLayout({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: ScreenHelper.screenWidth(context),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: const Color(0xFF858585),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
