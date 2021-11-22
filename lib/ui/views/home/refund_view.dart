import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class RefundView extends StatelessWidget {
  const RefundView({Key? key}) : super(key: key);

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
            Icons.attach_money,
            color: primaryColor,
            size: 50.0,
          ),
        ),
      )
      ..add(
        Text(
          locale.read('refund'),
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      )
      ..add(_buildSeparation())
      ..add(
        Text(
          locale.read('refund_policy'),
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
