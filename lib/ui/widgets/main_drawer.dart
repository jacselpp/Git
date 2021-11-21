import 'package:detooo_recargas/ui/views/auth/profile_view.dart';
import 'package:detooo_recargas/ui/views/home/contact_view.dart';
import 'package:detooo_recargas/ui/views/home/privacy_view.dart';
import 'package:detooo_recargas/ui/views/home/refund_view.dart';
import 'package:detooo_recargas/ui/views/home/terms_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return SizedBox(
      width: ScreenHelper.screenWidth(context) * .6,
      child: Drawer(
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              _buildHeader(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  locale.read('recharges'),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: primaryColor,
                      ),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HistoryView()));
                },
              ),
              _buildItem(
                Icons.add_reaction,
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
              const Divider(
                thickness: 2.0,
              ),
              _buildItem(
                Icons.rss_feed_sharp,
                locale.read('about'),
                context,
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeLayout(
                        child: Column(children: const [
                          BuildSuggestions(),
                          BuildHelp(),
                        ]),
                      ),
                    ),
                  );
                },
              ),
              _buildItem(
                Icons.call,
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
                Icons.menu_book,
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
                Icons.attach_money,
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
              _buildItem(
                Icons.lock_outline,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 100.0,
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
              child: Center(
                child: SizedBox(
                  // width: 50.0,
                  height: 50.0,
                  child: SvgPicture.asset(
                    'assets/images/Recargas_Imagotipo.svg',
                    fit: BoxFit.fitHeight,
                  ),
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
      title: Text(
        value,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: primaryColor,
            ),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).appBarTheme.iconTheme!.color,
      ),
      onTap: onTap,
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
}
