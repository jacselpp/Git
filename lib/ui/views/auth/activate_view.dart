import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../app_ui.dart';

class ActivateUserView extends StatefulWidget {
  const ActivateUserView({Key? key}) : super(key: key);

  @override
  _ActivateUserViewState createState() => _ActivateUserViewState();
}

class _ActivateUserViewState extends State<ActivateUserView> {
  final TextEditingController _codeController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
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
                      color: primaryColor,
                      label: locale.read('activate_account'),
                      onPressed: () => _handleConfirm(),
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

  _handleConfirm() {}
}
