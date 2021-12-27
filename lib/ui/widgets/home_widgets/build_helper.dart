import 'package:flutter/material.dart';
import 'package:detooo_recargas/ui/app_ui.dart';

class BuildHelp extends StatelessWidget {
  const BuildHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.screenWidth(context),
      child: Image.asset(
        'assets/images/102.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
