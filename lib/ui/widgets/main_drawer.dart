import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';

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
              Icons.group,
              locale.read('profile'),
              context,
              () {},
            ),
            _buildItem(
              Icons.password,
              locale.read('security'),
              context,
              () {},
            ),
            _buildItem(
              Icons.logout,
              locale.read('logout'),
              context,
              () {
                UserRepository().logout();
              },
            ),
            const Divider(
              thickness: 2.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor75,
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
                  bottom: 100.0,
                ),
                child: SvgPicture.asset(
                  'assets/images/1_Logo_Recargas.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          (context.watch<ProfileProvider>().profile != null)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              maxRadius: 40.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  context
                                          .watch<ProfileProvider>()
                                          .profile
                                          ?.avatar ??
                                      "",
                                  scale: 20.0),
                            ),
                          ),
                        ],
                      ),
                      Text(context.watch<ProfileProvider>().profile?.fullname ??
                          ''),
                      Text(context.watch<ProfileProvider>().profile?.email ??
                          ''),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.supervised_user_circle_sharp,
                                  size: 75.0,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(''),
                      const Text(''),
                    ],
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
