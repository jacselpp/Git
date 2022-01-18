import 'package:detooo_recargas/services/providers/stripe_key_provider.dart';
import 'package:detooo_recargas/ui/widgets/main_appbar.dart';
import 'package:detooo_recargas/ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;
  final TabBar? tabBar;
  final bool mainDrawer;
  final ScrollController? scrollController;

  final Widget? floatingActionButton;

  const HomeLayout({
    Key? key,
    required this.child,
    this.tabBar,
    this.scrollController,
    this.mainDrawer = false,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: widget.floatingActionButton,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<StripeKeyProvider>().fetchStripeKey;
        },
      ),
      appBar: MainAppBar().appBar(context, showBcak: !widget.mainDrawer),
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
