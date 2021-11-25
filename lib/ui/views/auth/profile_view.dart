import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/widgets/main_appbar.dart';
import 'package:detooo_recargas/ui/widgets/profile/tab_general.dart';
import 'package:detooo_recargas/ui/widgets/profile/tab_security.dart';
import 'package:detooo_recargas/ui/widgets/profile/tab_testimonial.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final int initialIndex;
  const ProfileView({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 3,
      child: Scaffold(
        body: const TabBarView(
          children: [
            TabGeneral(),
            TabTestimonials(),
            TabSecurity(),
          ],
        ),
        appBar: MainAppBar().appBar(
          context,
          tabBar: TabBar(
            labelColor: Theme.of(context).textTheme.subtitle1!.color,
            labelPadding: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(0),
            labelStyle: const TextStyle(fontSize: 14.0),
            tabs: [
              Tab(text: locale.read('tab_general').toUpperCase()),
              Tab(text: locale.read('tab_testimony').toUpperCase()),
              Tab(text: locale.read('tab_security').toUpperCase()),
            ],
          ),
        ),
      ),
    );
  }
}
