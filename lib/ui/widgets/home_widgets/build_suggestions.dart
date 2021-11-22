import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_cubacel_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_ui.dart';
import '../../screen_helper.dart';

class BuildSuggestions extends StatelessWidget {
  const BuildSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions(context);
  }

  Widget _buildSuggestions(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: _buildSuggestionsItems(context),
    );
  }

  Widget _buildSuggestionsItems(BuildContext context) {
    return Column(
      children: [
        _topUpstoCuba(context),
      ],
    );
  }

  Widget _topUpstoCuba(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: ScreenHelper.screenWidth(context),
              color: Theme.of(context).cardColor,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/101.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderTopUp(AppLocalizations locale, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale.read('top_up'),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: ScreenHelper.isPortrait(context)
                      ? Theme.of(context).textTheme.headline5!.color
                      : Theme.of(context).appBarTheme.backgroundColor!,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            locale.read('top_up_subtitle'),
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: ScreenHelper.isPortrait(context)
                      ? Theme.of(context).textTheme.headline4!.color
                      : Theme.of(context).appBarTheme.backgroundColor!,
                ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                color: ScreenHelper.isPortrait(context)
                    ? primaryColor
                    : Theme.of(context).appBarTheme.backgroundColor!,
                label: locale.read('top_up_now'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RecargasCubacelView(),
                  ));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _buildIconsRow(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEachIcon(
          context,
          locale,
          asset: 'assets/images/Icon_1.svg',
          key: 'recharges',
          value: '1000+',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: 5.0,
          height: 50.0,
          color: primaryColor,
        ),
        _buildEachIcon(
          context,
          locale,
          asset: 'assets/images/Icon_2.svg',
          key: 'users',
          value: '200+',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: 5.0,
          height: 50.0,
          color: primaryColor,
        ),
        _buildEachIcon(
          context,
          locale,
          asset: 'assets/images/Icon_3.svg',
          key: 'satisfied_clients',
          value: '200+',
        ),
      ],
    );
  }

  Widget _buildIconsRowColumn(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEachIcon(
            context,
            locale,
            asset: 'assets/images/Icon_1.svg',
            key: 'recharges',
            value: '1000+',
          ),
          _buildEachIcon(
            context,
            locale,
            asset: 'assets/images/Icon_2.svg',
            key: 'users',
            value: '200+',
          ),
          _buildEachIcon(
            context,
            locale,
            asset: 'assets/images/Icon_3.svg',
            key: 'satisfied_clients',
            value: '200+',
          ),
        ],
      ),
    );
  }

  Row _buildEachIcon(
    BuildContext context,
    AppLocalizations locale, {
    required String asset,
    required String key,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              locale.read(key),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    );
  }
}
