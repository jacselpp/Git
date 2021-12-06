import 'package:flutter/material.dart';
import 'package:detooo_recargas/ui/app_ui.dart';

class BuildHelp extends StatelessWidget {
  const BuildHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Builder(
                builder: (ctx) {
                  return Image.asset(
                    'assets/images/102.png',
                    width: ScreenHelper.screenWidth(ctx),
                  );
                },
              ),
            ),
            // if (!ScreenHelper.isPortrait(context))
            //   Expanded(
            //     child: _buildHelp(context),
            //   ),
          ],
        ),
      ],
    );
  }
}
