import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/providers/countries_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/search/country_search_delegate.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailController = TextEditingController();
  final _movilController = TextEditingController();
  final _usernameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  Country? _countrySelected;

  bool _visiblePassword1 = true, _visiblePassword2 = true;

  void _handleVisiblePassword1() {
    setState(() {
      _visiblePassword1 = !_visiblePassword1;
    });
  }

  void _handleVisiblePassword2() {
    setState(() {
      _visiblePassword2 = !_visiblePassword2;
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _countryController.dispose();
    _usernameController.dispose();
    _password1Controller.dispose();
    _password2Controller.dispose();
    _emailController.dispose();
    _movilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AuthLayout(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _buildLoginForm(locale, context),
        ),
      ),
    );
  }

  Form _buildLoginForm(AppLocalizations locale, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale.read('register'),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            locale.read('register_subtitle'),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return locale.read('error_invalid_name');
              }
            },
            controller: _fullNameController,
            label: locale.read('fullname'),
          ),
          const SizedBox(
            height: 10,
          ),
          //! Seleccionar país
          CustomTextFormField(
            suffixIcon: const Icon(Icons.arrow_drop_down),
            label: locale.read('country'),
            validator: (s) {
              if (_countrySelected?.name == null) {
                return locale.read('error_select_country');
              }
            },
            readOnly: true,
            onTap: () {
              _showCountrySearch(context);
            },
            controller: _countryController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            validator: (value) => validateEmail(
              context: context,
              value: value,
            ),
            controller: _emailController,
            label: locale.read('email'),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _movilController,
            label: locale.read('movil'),
            validator: (value) => validatePhone(
              context: context,
              value: value,
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _password1Controller,
            obscureText: _visiblePassword1,
            label: locale.read('password'),
            suffixIcon: IconButton(
              onPressed: _handleVisiblePassword1,
              icon: Icon(
                (_visiblePassword1) ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) => validatePassword(
              context: context,
              value: value,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _password2Controller,
            obscureText: _visiblePassword2,
            label: locale.read('repeat_password'),
            suffixIcon: IconButton(
              onPressed: _handleVisiblePassword2,
              icon: Icon(
                (_visiblePassword2) ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value != _password1Controller.text) {
                return locale.read('error_password_no_match');
              }
            },
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
                  label: locale.read('register'),
                  onPressed: () {
                    _handleRegister(context);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showCountrySearch(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    await context
        .read<CountriesProvider>()
        .fetchAllCountries()
        .then((value) async {
      _countrySelected = await showSearch(
        context: context,
        delegate: CountrySearch(),
      );
    });
    _countryController.value =
        TextEditingValue(text: _countrySelected?.name ?? "");
  }

  void _handleRegister(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    if (!_formKey.currentState!.validate()) return;
    showMessage(context, locale.read('loading'), TypeMessage.LOADING);

    User userRegister = User(
      fullname: _fullNameController.text,
      country: _countrySelected!,
      email: _emailController.text,
      movil: _movilController.text,
      password: _password1Controller.text,
      confirmPassword: _password2Controller.text,
      acceptTerms: true,
    );
    UserRepository().register(userRegister, context);
  }
}
