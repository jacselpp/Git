import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/app/app_providers.dart';
import 'package:detooo_recargas/services/providers/language_provider.dart';
import 'package:detooo_recargas/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/services/firebase/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'app/app_locator.dart';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _enablePlatformOverrideForDesktop();
  setupLocator();

  await SharedPreference.initialize();

  if (!kIsWeb) await PushNotificationService.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: Builder(builder: (context) {
        return ThemeProvider(
          initTheme: SharedPreference.getDarkMode,
          builder: (_, myTheme) => MaterialApp(
            navigatorKey: NavigatorProvider().navigatorKey,
            title: 'Detooo Recargas',
            debugShowCheckedModeBanner: false,
            // Routes
            initialRoute: Routes.SPLASH,

            onGenerateRoute: Routes.appRoutes,
            // THEMES
            theme: myTheme,

            // LANGUAGE
            supportedLocales: const [Locale('en', ''), Locale('es', '')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            locale: context.watch<LanguageProvider>().language,
          ),
        );
      }),
    );
  }
}
