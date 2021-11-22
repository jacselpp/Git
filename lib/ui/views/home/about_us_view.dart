import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlternativeHomeLayout(
      child: Column(
        children: _buildTerms(context),
      ),
    );
  }

  List<Widget> _buildTerms(BuildContext context) {
    List<Widget> termsItems = [];
    final locale = AppLocalizations.of(context)!;

    termsItems
      ..add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.help_outline,
            color: primaryColor,
            size: 50.0,
          ),
        ),
      )
      ..add(
        Center(
          child: Text(
            locale.read('about_us'),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      )
      ..add(_buildSeparation())
      ..add(
        Text(
          locale.read('about_us_content'),
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.justify,
        ),
      )
      ..add(_buildSeparation())
      ..add(const Divider())
      ..add(_buildSeparation())
      ..add(
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 75.0,
            child: SvgPicture.asset(
              'assets/images/03.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      )
      ..add(_buildSeparation())
      ..add(
        Text(
          locale.read('detooo_recargas'),
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.justify,
        ),
      );
    return termsItems;
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 20.0,
    );
  }
}
