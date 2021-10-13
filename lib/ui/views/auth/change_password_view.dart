import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/layouts/home_layout.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(child: _buildContetnt(context));
  }

  Widget _buildContetnt(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        _buildAvatar(context),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: locale.read('old_password'),
                    ),
                    _buildSeparation(),
                    CustomTextFormField(
                      label: locale.read('new_password'),
                    ),
                    _buildSeparation(),
                    CustomTextFormField(
                      label: locale.read('repeat_new_password'),
                    ),
                    _buildSeparation(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextButton(
                            color: primaryColor,
                            label: locale.read('change_password'),
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
        ),
      ],
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
