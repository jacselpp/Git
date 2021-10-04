import 'package:detooo_recargas/services/providers/provincias_provider.dart';
import 'package:detooo_recargas/utils/search/provincias_search_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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
  final _usernameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  bool _visiblePassword1 = true, _visiblePassword2 = true;
  // bool _visiblePassword2 = true;

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
            hintText: locale.read('country_hint'),
            onChanged: (a) {},
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
            controller: _usernameController,
            label: locale.read('phone_email'),
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
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                child: Icon(Icons.info),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    locale.read('optional_fields'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.arrow_drop_down),
            label: locale.read('province'),
            hintText: locale.read('province_hint'),
            onChanged: (a) {},
            readOnly: true,
            onTap: () {
              _showProvinciasSearch(context);
            },
            controller: _countryController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.arrow_drop_down),
            label: locale.read('municipality'),
            hintText: locale.read('municipality_hint'),
            onChanged: (a) {},
            readOnly: true,
            onTap: () {},
            controller: _countryController,
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
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showCountrySearch(BuildContext context) async {
    await context.read<CountriesProvider>().fetchAllCountries().then((value) {
      showSearch(
        context: context,
        delegate: CountrySearch(),
      );
    });
  }

  void _showProvinciasSearch(BuildContext context) async {
    await context.read<ProvinciasProvider>().fetchAllProvincias().then((value) {
      showSearch(
        context: context,
        delegate: ProvinciasSearch(),
      );
    });
  }
}
