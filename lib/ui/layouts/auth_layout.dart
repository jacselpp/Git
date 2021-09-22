import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:detooo_recargas/ui/app_ui.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    bool isPortrait = ScreenHelper.isPortrait(context);
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              if (isPortrait) _buildHeader(context, isPortrait),
              _buildBody(context, locale),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isPortrait,
  ) =>
      SliverAppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        expandedHeight: isPortrait ? 280.0 : 0.0,
        floating: false,
        pinned: false,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildBody(BuildContext context, locale) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: child,
        ),
      );
}
