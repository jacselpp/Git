import 'dart:io';
import 'dart:async';
import 'package:detooo_recargas/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'app/app_locator.dart';
import 'package:detooo_recargas/utils/routes.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/app/app_providers.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/services/providers/language_provider.dart';
import 'package:detooo_recargas/services/firebase/firebase_messaging.dart';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

Future<void> _setOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    await _setOrientation();
    _enablePlatformOverrideForDesktop();
    setupLocator();

    await SharedPreference.initialize();

    if (!kIsWeb) await PushNotificationService.initializeApp();
    runApp(const MyApp());
  }, (error, stackTrace) {
    LogUtils().logger.log(Level.debug, [error, stackTrace]);
  });
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
