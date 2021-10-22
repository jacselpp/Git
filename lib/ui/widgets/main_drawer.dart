import 'package:detooo_recargas/ui/views/recargas/recargas_cubacel_view.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_nauta_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/app/app_localizations.dart';

import '../app_ui.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            _buildHeader(context),
            _buildItem(
              Icons.home,
              locale.read('home'),
              context,
              () {
                Navigator.of(context).pushNamed(Routes.HOME);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                locale.read('recharges'),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _buildItem(
              Icons.phone_android,
              locale.read('cubacel'),
              context,
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RecargasCubacelView(),
                  ),
                );
              },
            ),
            _buildItem(
              Icons.wifi,
              locale.read('nauta'),
              context,
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RecargasNautaView(),
                  ),
                );
              },
            ),
            _buildItem(
              Icons.history,
              locale.read('history'),
              context,
              () {
                Navigator.of(context).pushNamed(Routes.HOME);
              },
            ),
            const Divider(
              thickness: 2.0,
            ),
            _buildItem(
              Icons.dashboard,
              locale.read('dashboard'),
              context,
              () {
                Navigator.of(context).pushNamed(Routes.DASHBOARD);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).cardColor,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
            ),
            child: SizedBox(
              width: ScreenHelper.screenWidth(context),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                  bottom: 15.0,
                ),
                child: SvgPicture.asset(
                  'assets/images/Recargas_Imagotipo.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String value, BuildContext context,
      Null Function() onTap) {
    return ListTile(
      title: Text(value),
      leading: Icon(
        icon,
        color: Theme.of(context).appBarTheme.iconTheme!.color,
      ),
      onTap: onTap,
    );
  }
}
