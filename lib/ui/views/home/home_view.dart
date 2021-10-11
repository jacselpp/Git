import 'package:detooo_recargas/ui/layouts/home_layout.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      child: Text("home view"),
    );
  }
}
