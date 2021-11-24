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
        child: CustomContainer(
          child: child,
        ),
      ),
    );
  }
}
