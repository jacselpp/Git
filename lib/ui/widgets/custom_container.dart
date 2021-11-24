import 'package:flutter/material.dart';

import '../app_ui.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double paddingH, paddingV;

  const CustomContainer({
    Key? key,
    required this.child,
    this.paddingH = 20.0,
    this.paddingV = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).cardTheme.shadowColor!,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingH,
          vertical: paddingV,
        ),
        child: child,
      ),
    );
  }
}
