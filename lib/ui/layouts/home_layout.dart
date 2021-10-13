import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:detooo_recargas/app/app_theme.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              child: SvgPicture.asset(
                ThemeProvider.of(context)!.brightness == Brightness.light
                    ? 'assets/images/Recargas_Identidad_H.svg'
                    : 'assets/images/Recargas_Identidad_H_dark.svg',
              ),
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
              icon: const Icon(Icons.dark_mode),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(child: child),
    );
  }
}
