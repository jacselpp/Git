import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';

import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/layouts/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Profile? _profile;
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        child: Column(
      children: [
        _buildAvatar(context),
        _buildBody(context),
      ],
    ));
  }

  Widget _buildBody(BuildContext context) {
    _profile = Provider.of<ProfileProvider>(context, listen: false).profile;

    final locale = AppLocalizations.of(context)!;
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextFormField(
                  initialValue: _profile?.fullname,
                  label: locale.read('fullname'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  initialValue: _profile?.country?.name,
                  label: locale.read('country'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  initialValue: _profile?.email,
                  label: locale.read('email'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  initialValue: _profile?.movil,
                  label: locale.read('movil'),
                ),
                const Divider(),
                _buildSeparation(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextButton(
                        color: primaryColor,
                        label: locale.read('update_profile'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 20.0,
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  maxRadius: 60.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      context.watch<ProfileProvider>().profile!.avatar!),
                ),
              ),
            ],
          ),
          Text(context.watch<ProfileProvider>().profile?.fullname ?? ''),
          Text(context.watch<ProfileProvider>().profile?.email ?? ''),
        ],
      ),
    );
  }
}
