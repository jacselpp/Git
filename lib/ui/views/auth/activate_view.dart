import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/ui/views/auth/login_view.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../app_ui.dart';

class ActivateUserView extends StatefulWidget {
  final String? id;
  const ActivateUserView(this.id, {Key? key}) : super(key: key);

  @override
  _ActivateUserViewState createState() => _ActivateUserViewState();
}

class _ActivateUserViewState extends State<ActivateUserView> {
  final TextEditingController _codeController = TextEditingController();
  bool _loading = false;
  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Card(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                controller: _codeController,
                label: locale.read('confirmation_code'),
                onChanged: (value) {
                  if (value != null && value.length == 6) {
                    _handleConfirm(locale, context);
                  }
                },
                validator: (value) => validateIsNumeric(
                  context: context,
                  value: value,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      color: !_loading ? primaryColor : Colors.grey,
                      label: locale.read('activate_account'),
                      onPressed: !_loading
                          ? () => _handleConfirm(locale, context)
                          : () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _handleConfirm(AppLocalizations locale, BuildContext context) async {
    setState(() {
      _loading = true;
    });
    showMessage(
      context,
      locale.read('loading'),
      TypeMessage.LOADING,
    );

    await APIUsers.common()
        .verifyMovil(UserVerifyMovil(
      userId: widget.id,
      code: _codeController.text,
    ))
        .then((value) {
      Navigator.of(context)
          .pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => const LoginView(),
            ),
            (route) => false,
          )
          .catchError((e) => HandleError.logError(context, e));
    });
    setState(() {
      _loading = false;
    });
  }
}
