import 'dart:async';

import 'package:detooo_recargas/app/app_locator.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    showSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/animations/Animacion_Carga.json',
        width: 250,
        height: 250,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..repeat();
        },
      ),
    );
  }

  void showSplash() => Timer(const Duration(milliseconds: 5000), navigate);

  void navigate() {
    final sharedPreference = locator<SharedPreference>();
    String? token = sharedPreference.readToken;
    bool? notFirstTime = sharedPreference.getIsNotFirstTime;

    if (notFirstTime == null || notFirstTime == false) {
      Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
    } else {
      (token == null || token.isEmpty)
          ? Navigator.of(context).pushReplacementNamed(Routes.LOGIN)
          : Navigator.of(context).pushReplacementNamed(Routes.HOME);
    }
  }
}
