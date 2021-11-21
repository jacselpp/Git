import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/ui/widgets/profile/tab_avatar.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';

class TabSecurity extends StatefulWidget {
  const TabSecurity({Key? key}) : super(key: key);

  @override
  _TabSecurityState createState() => _TabSecurityState();
}

class _TabSecurityState extends State<TabSecurity> {
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
    return _buildContetnt(context);
  }

  Widget _buildContetnt(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        children: [
          const AvatarTab(canChange: false),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.read('change_password'),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Divider(),
                      _buildSeparation(),
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
      ),
    );
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 20.0,
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
