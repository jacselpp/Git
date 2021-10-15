import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/utils/validators.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatNewPasswordController =
      TextEditingController();

  bool _newPassword = true, _oldPassword = true, _repeatPassword = true;

  _handleChangeNewPassword() {
    setState(() {
      _newPassword = !_newPassword;
    });
  }

  _handleChangeOldPassword() {
    setState(() {
      _oldPassword = !_oldPassword;
    });
  }

  _handleChangeRepeatPassword() {
    setState(() {
      _repeatPassword = !_repeatPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: _buildContetnt(context),
    );
  }

  Widget _buildContetnt(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        _buildAvatar(context),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _oldPasswordController,
                      label: locale.read('old_password'),
                      obscureText: _oldPassword,
                      suffixIcon: IconButton(
                        onPressed: _handleChangeOldPassword,
                        icon: Icon(
                          (_oldPassword)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) => validatePassword(
                        context: context,
                        value: value,
                      ),
                    ),
                    _buildSeparation(),
                    CustomTextFormField(
                      controller: _newPasswordController,
                      label: locale.read('new_password'),
                      obscureText: _newPassword,
                      suffixIcon: IconButton(
                        onPressed: _handleChangeNewPassword,
                        icon: Icon(
                          (_newPassword)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) => validatePassword(
                        context: context,
                        value: value,
                      ),
                    ),
                    _buildSeparation(),
                    CustomTextFormField(
                      controller: _repeatNewPasswordController,
                      label: locale.read('repeat_new_password'),
                      obscureText: _repeatPassword,
                      suffixIcon: IconButton(
                        onPressed: _handleChangeRepeatPassword,
                        icon: Icon(
                          (_repeatPassword)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) => validatePassword(
                        context: context,
                        value: value,
                      ),
                    ),
                    _buildSeparation(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextButton(
                            color: primaryColor,
                            label: locale.read('change_password'),
                            onPressed: () {
                              _handleChangePassword(context);
                            },
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

  void _handleChangePassword(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    UserRepository().changePassword(
      UserPassword(
        oldPassword: _oldPasswordController.text,
        password: _newPasswordController.text,
        confirmPassword: _repeatNewPasswordController.text,
      ),
      context,
    );
  }
}
