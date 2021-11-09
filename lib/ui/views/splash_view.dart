import 'dart:async';
import 'package:detooo_recargas/app/app_connectivity.dart';
import 'package:detooo_recargas/services/providers/municipios_provider.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';
import 'package:detooo_recargas/services/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/shared_preference.dart';

import '../screen_helper.dart';
import 'auth/activate_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    showSplash();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBackground(context),
    );
  }

  void showSplash() => Timer(const Duration(milliseconds: 500), navigate);

  void navigate() {
    String? token = SharedPreference.readUserKey;
    String? _key = SharedPreference.readUserKey;
    String? uid = SharedPreference.userId;

    if (_key != null) {
      context.read<ProfileProvider>().fetchProfile();
      context.read<SubscriptionsProvider>().fetchSubscribed();
    }

    context.read<ProvinciasProvider>().fetchAllProvincias();
    context.read<MunicipiosProvider>().fetchAllMunicipios();

    (uid != null)
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ActivateUserView(uid)))
        : (token == null || token.isEmpty)
            ? Navigator.of(context).pushReplacementNamed(Routes.LOGIN)
            : Navigator.of(context).pushReplacementNamed(Routes.HOME);
  }

  Widget _buildBackground(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/1_Imagen_Recargas.svg',
      fit:
          ScreenHelper.isPortrait(context) ? BoxFit.fitHeight : BoxFit.fitWidth,
    );
  }
}
