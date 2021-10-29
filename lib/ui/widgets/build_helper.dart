import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildHelp extends StatelessWidget {
  const BuildHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: primaryColor,
          child: Row(
            children: [
              Expanded(
                child: Builder(
                  builder: (ctx) {
                    return Image.asset(
                      'assets/images/Promo_2.png',
                      width: ScreenHelper.screenWidth(ctx),
                    );
                  },
                ),
              ),
              if (!ScreenHelper.isPortrait(context))
                Expanded(
                  child: _buildHelp(context),
                ),
            ],
          ),
        ),
        if (ScreenHelper.isPortrait(context)) _buildHelp(context),
      ],
    );
  }

  Widget _buildHelp(BuildContext context) {
    final bool isPortrait = ScreenHelper.isPortrait(context);
    final locale = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.read('safe_fast_easy'),
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: ScreenHelper.isPortrait(context)
                    ? Theme.of(context).textTheme.headline4!.color
                    : Theme.of(context).appBarTheme.backgroundColor!,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          locale.read('safe_fast_easy_subtitle'),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: ScreenHelper.isPortrait(context)
                    ? Theme.of(context).textTheme.headline4!.color
                    : Theme.of(context).appBarTheme.backgroundColor!,
              ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEachIcon(
                context,
                locale,
                asset: isPortrait
                    ? 'assets/images/Icon_4.svg'
                    : 'assets/images/Icon_4.2.svg',
                value: 'sign_in',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Container(
                  width: 5.0,
                  height: 25.0,
                  color:
                      isPortrait ? primaryColor : Theme.of(context).cardColor,
                ),
              ),
              _buildEachIcon(
                context,
                locale,
                asset: isPortrait
                    ? 'assets/images/Icon_5.svg'
                    : 'assets/images/Icon_5.2.svg',
                value: 'order',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Container(
                  width: 5.0,
                  height: 25.0,
                  color:
                      isPortrait ? primaryColor : Theme.of(context).cardColor,
                ),
              ),
              _buildEachIcon(
                context,
                locale,
                asset: isPortrait
                    ? 'assets/images/Icon_6.svg'
                    : 'assets/images/Icon_6.2.svg',
                value: 'pay',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildEachIcon(
    BuildContext context,
    AppLocalizations locale, {
    required String asset,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: SvgPicture.asset(asset),
          ),
        ),
        Text(
          locale.read(value),
          textAlign: TextAlign.left,
          style: TextStyle(
            color: ScreenHelper.isPortrait(context)
                ? Theme.of(context).textTheme.headline4!.color
                : Theme.of(context).appBarTheme.backgroundColor!,
          ),
        ),
      ],
    );
  }
}
