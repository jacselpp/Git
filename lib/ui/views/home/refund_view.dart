import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class RefundView extends StatelessWidget {
  const RefundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: Container(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 50.0,
          ),
          child: Column(
            children: _buildTerms(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTerms(BuildContext context) {
    List<Widget> termsItems = [];
    final locale = AppLocalizations.of(context)!;

    termsItems
      ..add(
        Text(
          locale.read('refund'),
          style: Theme.of(context).textTheme.headline4,
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
