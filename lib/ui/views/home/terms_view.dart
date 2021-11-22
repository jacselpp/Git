import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

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
    int counter = 1;

    termsItems
      ..add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.error_outline,
            color: primaryColor,
            size: 50.0,
          ),
        ),
      )
      ..add(
        Text(
          locale.read('service_terms'),
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      )
      ..add(_buildSeparation());

    while (
        locale.read('terms_s${counter}_title') != 'terms_s${counter}_title') {
      termsItems
        ..add(
          Text(
            locale.read('terms_s${counter}_title'),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        )
        ..add(_buildSeparation())
        ..add(
          Text(
            locale.read('terms_s${counter}_content'),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.justify,
          ),
        )
        ..add(_buildSeparation());
      ++counter;
    }

    return termsItems;
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 20.0,
    );
  }
}
