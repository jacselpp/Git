import 'package:flutter/material.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/app/app_localizations.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    // bool isPortrait = ScreenHelper.isPortrait(context);
    return Material(
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   shadowColor: Colors.transparent,
          // ),
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              // if (kIsWeb || !ScreenHelper().isPortrait(context))
              const SliverAppBar(
                floating: true,
                pinned: true,
                toolbarHeight: 50.0,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                shadowColor: Colors.transparent,
              ),
              _buildBody(context, locale),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, locale) => SliverToBoxAdapter(
        child: SizedBox(
          height: ScreenHelper.screenHeight(context) - 60,
          // width: ScreenHelper.screenWidth(context),
          child: Center(
            child: SingleChildScrollView(
              primary: false,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: child,
              ),
            ),
          ),
        ),
      );
}
