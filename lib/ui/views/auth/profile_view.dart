import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
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
      child: HomeLayout(
        child: const TabBarView(
          children: [
            TabGeneral(),
            TabTestimonials(),
            TabSecurity(),
          ],
        ),
        tabBar: TabBar(
          tabs: [
            Tab(text: locale.read('tab_general').toUpperCase()),
            Tab(text: locale.read('tab_testimony').toUpperCase()),
            Tab(text: locale.read('tab_security').toUpperCase()),
          ],
        ),
      ),
    );
  }
}
