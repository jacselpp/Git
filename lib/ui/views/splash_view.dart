import 'dart:async';
import 'package:detooo_recargas/services/providers/municipios_provider.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';
import 'package:detooo_recargas/services/providers/subscriptions_provider.dart';
import 'package:detooo_recargas/services/providers/terms_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/shared_preference.dart';

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
      backgroundColor: Theme.of(context).cardColor,
      body: _buildBackground(context),
    );
  }

  void showSplash() => Timer(const Duration(milliseconds: 1000), navigate);

  void navigate() {
    String? token = SharedPreference.readUserKey;
    String? _key = SharedPreference.readUserKey;
    String? uid = SharedPreference.userId;

    context.read<TermsProvider>().fetchSections;

    if (_key != null) {
      context.read<ProfileProvider>().fetchProfile();
      context.read<SubscriptionsProvider>().fetchSubscribed();
      context.read<PackagesProvider>().fetchPackages();
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
    return Center(
      child: SizedBox(
        height: 100.0,
        child: Hero(
          tag: 'assets/images/01.svg',
          child: SvgPicture.asset(
            'assets/images/01.svg',
          ),
        ),
      ),
    );
  }
}
