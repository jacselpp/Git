import 'package:detooo_recargas/ui/widgets/main_appbar.dart';
import 'package:detooo_recargas/ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;
  final TabBar? tabBar;
  final bool mainDrawer;
  final bool showBack;
  final ScrollController? scrollController;

  final Widget? floatingActionButton;

  const HomeLayout({
    Key? key,
    required this.child,
    this.tabBar,
    this.scrollController,
    this.mainDrawer = false,
    this.floatingActionButton,
    this.showBack = false,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      appBar: MainAppBar().appBar(context, showBcak: widget.showBack),
      drawer: widget.mainDrawer ? const MainDrawer() : null,
      body: SingleChildScrollView(
        controller: widget.scrollController,
        primary: false,
        child: Column(
          children: [
            widget.child,
          ],
        ),
      ),
    );
  }
}
