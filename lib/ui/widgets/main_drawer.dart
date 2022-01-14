import 'package:detooo_recargas/ui/views/home/about_us_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:detooo_recargas/ui/views/auth/profile_view.dart';
import 'package:detooo_recargas/ui/views/home/contact_view.dart';
import 'package:detooo_recargas/ui/views/home/privacy_view.dart';
import 'package:detooo_recargas/ui/views/home/refund_view.dart';
import 'package:detooo_recargas/ui/views/home/terms_view.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/views/home/history_view.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_cubacel_view.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_nauta_view.dart';

import '../app_ui.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Drawer(
      child: Material(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              _buildHeader(context),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10.0,
              ),
              _buildItem(
                Icon(
                  Icons.phone_android,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                // Icons.phone_android,
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
                // Icons.wifi,
                Icon(
                  Icons.wifi,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
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
                // Icons.history,
                Icon(
                  Icons.history,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                locale.read('history'),
                context,
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HistoryView()));
                },
              ),
              _buildItem(
                SvgPicture.asset(
                  'assets/images/36.svg',
                  width: 20.0,
                  height: 20.0,
                ),
                locale.read('tab_testimony'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeLayout(
                        floatingActionButton: _addTestimonialsButton(context),
                        child: const TestimonialsWidget(
                          vertical: true,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Divider(),
              _buildItem(
                Icon(
                  Icons.help_outline,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                // Icons.help_outline,
                locale.read('about_us'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AboutUsView(),
                    ),
                  );
                },
              ),
              _buildItem(
                Icon(
                  Icons.call,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                // Icons.call,
                locale.read('contact_us'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContactView(),
                    ),
                  );
                },
              ),
              _buildItem(
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                locale.read('terms'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TermsView(),
                    ),
                  );
                },
              ),
              _buildItem(
                Icon(
                  Icons.security,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                // Icons.lock_outline,
                locale.read('policy'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyView(),
                    ),
                  );
                },
              ),
              _buildItem(
                Icon(
                  Icons.attach_money,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                locale.read('refund'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RefundView(),
                    ),
                  );
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildItemApp('04.svg', 'https://anuncios.detooo.com'),
                    _buildItemApp('05.svg', 'https://shop.detooo.com'),
                    // _buildItemApp('06.svg', 'https://www.exeditec.com'),
                  ],
                ),
              ),
              const Divider(
                thickness: 2.0,
              ),
              _buildItem(
                const Icon(
                  Icons.power_settings_new,
                  color: primaryColor,
                ),
                locale.read('dialog_accept'),
                context,
                () {
                  showDialog(
                    context: context,
                    builder: (_) => dialogExit(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0,
        width: 120.0,
        child: SvgPicture.asset(
          'assets/images/03.svg',
        ),
      ),
    );
  }

  Widget _buildItem(
    Widget icon,
    String value,
    BuildContext context,
    Null Function() onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ListTile(
        title: Text(
          value,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: icon,
        onTap: onTap,
      ),
    );
  }

  Widget _addTestimonialsButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProfileView(
              initialIndex: 1,
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemApp(String app, String url) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: SizedBox(
          height: 60.0,
          width: 150.0,
          child: SvgPicture.asset(
            'assets/images/$app',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
