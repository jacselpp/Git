import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/widgets/main_appbar.dart';
import 'package:detooo_recargas/ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;
  final TabBar? tabBar;
  final bool mainDrawer;

  const HomeLayout({
    Key? key,
    required this.child,
    this.tabBar,
    this.mainDrawer = false,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().appBar(context, showBcak: !widget.mainDrawer),
      drawer: widget.mainDrawer ? const MainDrawer() : null,
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            widget.child,
            const DetoooInfo(),
          ],
        ),
      ),
    );
  }
}
