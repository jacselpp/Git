import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/services/firebase/firebase_messaging.dart';

import 'app/app_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  await SharedPreference().initialize();

  if (!kIsWeb) await PushNotificationService.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Detooo Recargas',
      debugShowCheckedModeBanner: false,
      // Routes
      initialRoute: Routes.SPLASH,
      onGenerateRoute: Routes.appRoutes,
    );
  }
}
