import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlternativeHomeLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            Icons.call,
            color: primaryColor,
            size: 50.0,
          ),
        ),
      )
      ..add(
        Center(
          child: Text(
            locale.read('contact_us'),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      )
      ..add(_buildSeparation())
      ..add(
        Text(
          '+1 (786) 203 7678\n +1 (702) 290 8661',
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
