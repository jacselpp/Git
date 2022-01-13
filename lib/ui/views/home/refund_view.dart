import 'package:detooo_recargas/services/providers/terms_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RefundView extends StatelessWidget {
  const RefundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = context.watch<TermsProvider>().sections[2].text!;

    return AlternativeHomeLayout(
      child: Column(
        children: _buildTerms(context, text),
      ),
    );
  }

  List<Widget> _buildTerms(BuildContext context, String text) {
    List<Widget> termsItems = [];

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
      ..add(_buildSeparation());

    List<List<String>> terms = _getText(text);

    for (var item in terms) {
      if (item[0].isNotEmpty) {
        termsItems
          ..add(
            Text(
              item[0],
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          )
          ..add(_buildSeparation());
      }
      if (item.length > 1 && item[1].isNotEmpty) {
        termsItems
          ..add(
            Text(
              item[1],
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.justify,
            ),
          )
          ..add(_buildSeparation());
      }
    }

    return termsItems;
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 20.0,
    );
  }

  List<List<String>> _getText(String terms) {
    List<String> str = terms.split('<h4>');
    List<List<String>> slist = [];

    for (var element in str) {
      slist.add(element.split("</h4>"));
    }
    int counter = 0;
    for (var element in slist) {
      if (element.length > 1) {
        List<String> sString = element[1].split('<p>');
        String a = '';
        if (sString.length > 1) {
          a = sString[1].split('</p>')[0];
        }
        slist[counter][1] = a;
      }
      ++counter;
    }
    return slist;
  }
}
