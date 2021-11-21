import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_ui.dart';
import '../../screen_helper.dart';

class BuildMap extends StatelessWidget {
  const BuildMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Separation(),
            Text(
              locale.read('somewhere_recharge'),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(
              height: ScreenHelper.screenWidth(context) * .05,
              width: ScreenHelper.screenWidth(context) * .1,
              child: SvgPicture.asset(
                'assets/images/Deto_Identidad_H.svg',
                fit: BoxFit.contain,
              ),
            ),
            const Separation(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.isPortrait(context)
                    ? ScreenHelper.screenWidth(context) * .1
                    : ScreenHelper.screenHeight(context) * .2,
              ),
              child: SizedBox(
                height: ScreenHelper.screenWidth(context) * .5,
                width: ScreenHelper.screenWidth(context),
                child: SvgPicture.asset(
                  'assets/images/mapa.svg',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
