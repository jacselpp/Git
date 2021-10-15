import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/app/app_theme.dart';
import 'package:detooo_recargas/services/providers/language_provider.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: Row(
          children: [
            SizedBox(
              height: 50.0,
              width:
                  ScreenHelper.screenWidthPercentage(context, percentage: 0.35),
              child: SvgPicture.asset('assets/images/Recargas_Identidad_H.svg'),
            ),
          ],
        ),
        actions: [
          ThemeSwitcher(
            builder: (context) => IconButton(
              onPressed: () {
                ThemeData themeName =
                    ThemeProvider.of(context)!.brightness != Brightness.light
                        ? AppTheme().lightTheme
                        : AppTheme().darkTheme;
                SharedPreference.setDarkMode(
                    ThemeProvider.of(context)!.brightness == Brightness.light);
                ThemeSwitcher.of(context)!.changeTheme(theme: themeName);
              },
              icon: ThemeProvider.of(context)!.brightness == Brightness.light
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final String appLocale =
                  Localizations.localeOf(context).languageCode;
              if (appLocale == 'en') {
                context
                    .read<LanguageProvider>()
                    .setLanguage(const Locale('es'));
              } else {
                context
                    .read<LanguageProvider>()
                    .setLanguage(const Locale('en'));
              }
            },
          ),
          PopupMenuButton(
            onSelected: (choice) => _choiceAction(choice.toString(), context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 15.0,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    context.watch<ProfileProvider>().profile?.avatar ?? "",
                    scale: 20.0),
              ),
            ),
            itemBuilder: (context) => [
              _buildMenuItem(
                context,
                "profile",
                const Icon(Icons.supervised_user_circle),
              ),
              _buildMenuItem(
                context,
                "security",
                const Icon(Icons.security),
              ),
              _buildMenuItem(
                context,
                "logout",
                const Icon(Icons.logout),
              ),
            ],
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(child: child),
    );
  }

  _choiceAction(String? choice, BuildContext context) {
    switch (choice) {
      case 'profile':
        Navigator.of(context).pushNamed(Routes.PROFILE);
        break;
      case 'security':
        Navigator.of(context).pushNamed(Routes.SECURITY);
        break;
      case 'logout':
        UserRepository().logout();
        break;
      default:
    }
  }

  PopupMenuItem _buildMenuItem(BuildContext context, String s, Icon icon) {
    final locale = AppLocalizations.of(context)!;
    return PopupMenuItem(
      value: s,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
            child: icon,
          ),
          Text(locale.read(s))
        ],
      ),
    );
  }
}
