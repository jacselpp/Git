import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(child: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locale.read('forgot_password'),
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(),
              CustomTextFormField(
                controller: _emailController,
                label: locale.read('phone_email'),
                validator: (value) {
                  String? isEmail = validateEmail(
                    context: context,
                    value: value,
                  );

                  //! dejar aqui por si hay que validar el movila para enviar el codigo
                  // String? isPhone = validatePhone(
                  //   context: context,
                  //   value: value,
                  // );

                  if (isEmail == null) {
                    return null;
                  } else {
                    return locale.read('error_invalid_email');
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      color: primaryColor,
                      label: locale.read('send'),
                      onPressed: () {
                        _handleForgotPassword(context);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleForgotPassword(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!_formKey.currentState!.validate()) return;
    User userEmail = User(email: _emailController.text);
    UserRepository().forgotPassword(userEmail, context);
  }
}
