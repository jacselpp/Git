import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _visiblePassword = true;

  void _handleVisiblePassword() {
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AuthLayout(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _buildLoginForm(locale),
        ),
      ),
    );
  }

  Form _buildLoginForm(AppLocalizations locale) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.read('start_session'),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            locale.read('start_session_subtitle'),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _usernameController,
            label: locale.read('phone_email'),
            validator: (value) {
              String? isEmail = validateEmail(context: context, value: value);
              String? isPhone = validatePhone(context: context, value: value);

              if (isEmail == null || isPhone == null) {
                return null;
              } else {
                return locale.read('error_invalid_phone_email');
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _passwordController,
            obscureText: _visiblePassword,
            label: locale.read('password'),
            validator: (value) => validatePassword(
              context: context,
              value: value,
            ),
            suffixIcon: IconButton(
              onPressed: _handleVisiblePassword,
              icon: Icon(
                (_visiblePassword) ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomTextButton(
                  color: primaryColor,
                  label: locale.read('login'),
                  onPressed: () {
                    _handleLogin(context);
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.REGISTER);
                },
                child: Text(locale.read('create_account')),
              ),
              TextButton(
                onPressed: () {},
                child: Text(locale.read('forgot_password')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    final locale = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    showMessage(context, locale.read('loading'), TypeMessage.LOADING);
    User userLogin = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    APIUsers.common().login(userLogin).then((value) {
      SharedPreference.saveUserKey(value.accessToken!);
      showMessage(context, locale.read('done_login'), TypeMessage.INFO);

      Navigator.of(context).pushReplacementNamed(Routes.HOME);
    }).catchError((e) => HandleError.logError(context, e));
  }
}
