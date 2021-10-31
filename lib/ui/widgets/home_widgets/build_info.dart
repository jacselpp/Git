import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetoooInfo extends StatelessWidget {
  const DetoooInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 50.0,
      ),
      child: Column(
        children: [
          _buildDetooo(context),
          _buildSeparation(),
          _buildInfo(context),
          _buildSeparation(),
          _buildContactUs(),
          _buildSeparation(),
          _buildOters(),
        ],
      ),
    );
  }

  Widget _buildDetooo(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(
          height: 50.0,
          child: SvgPicture.asset(
            'assets/images/Recargas_Imagotipo.svg',
            fit: BoxFit.fitHeight,
          ),
        ),
        Text(
          locale.read('detooo_recargas'),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          locale.read('info'),
          style: Theme.of(context).textTheme.headline6,
        ),
        _buildItem(locale.read('about_us')),
        _buildItem(locale.read('contact_us')),
        _buildItem(locale.read('terms')),
        _buildItem(locale.read('policy')),
        _buildItem(locale.read('refund')),
      ],
    );
  }

  Widget _buildItem(String name) {
    return Builder(builder: (context) {
      return GestureDetector(
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
    });
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 50.0,
    );
  }

  Widget _buildContactUs() {
    return Builder(builder: (context) {
      final locale = AppLocalizations.of(context)!;
      return Column(
        children: [
          Text(
            locale.read('contact_us'),
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '+1 (786) 203 7678\n+1 (702) 290 8661',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      );
    });
  }

  Widget _buildOters() {
    return Builder(builder: (context) {
      return Column(
        children: [
          _buildItemApp('Anuncios_Identidad_H.svg'),
          _buildItemApp('Combos_Identidad_H.svg'),
          _buildItemApp('Envios_Identidad_H.svg'),
        ],
      );
    });
  }

  Widget _buildItemApp(String app) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30.0,
        child: SvgPicture.asset('assets/images/$app'),
      ),
    );
  }
}
