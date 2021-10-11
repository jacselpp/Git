import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';
import 'package:detooo_recargas/ui/layouts/home_layout.dart';
import 'package:detooo_recargas/ui/views/auth/municipios_view.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/search/provincias_search_delegate.dart';
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
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  final _municipiosController = TextEditingController();
  final _provinciasController = TextEditingController();

  Provincias? _provinciaSelected;
  Country? _countrySelected;
  List<Municipios>? _municipiosSelected;

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
    _phoneController.dispose();
    super.dispose();
  }

  String get _textMunicipios {
    String municipios = '';

    for (var municipio in _municipiosSelected!) {
      municipios = '$municipios ${municipio.nombre},';
    }

    return municipios;
  }

  List<String> get _textMunicipiosId {
    List<String> municipios = [];

    for (var municipio in _municipiosSelected!) {
      municipios.add(municipio.id!);
    }

    return municipios;
  }

  @override
  Widget build(BuildContext context) {
    if (_municipiosSelected != null) {
      _municipiosController.value = TextEditingValue(text: _textMunicipios);
    }

    if (_provinciaSelected != null) {
      _provinciasController.value =
          TextEditingValue(text: _provinciaSelected?.nombre ?? "");
    }

    final locale = AppLocalizations.of(context)!;

    User? user = context.watch<ProfileProvider>().profile;

    if (user != null) {
      List<Municipios>? _municipiosSelec;
    }

    return HomeLayout(
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
            hintText: locale.read('country_hint'),
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
            controller: _phoneController,
            label: locale.read('phone'),
            validator: (value) => validatePhone(
              context: context,
              value: value,
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
            controller: _provinciasController,
            validator: (s) {
              if (_provinciaSelected?.nombre == null) {
                return locale.read('error_select_province');
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _municipiosController,
            suffixIcon: const Icon(Icons.arrow_drop_down),
            label: locale.read('municipality'),
            hintText: locale.read('municipality_hint'),
            onChanged: (a) {},
            readOnly: true,
            validator: (s) {
              if (_provinciaSelected?.nombre == null) {
                return locale.read('error_select_municipalities');
              }
            },
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              if (context.read<ProvinciasProvider>().provinciaSelected !=
                  null) {
                List<Municipios>? mun = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MunicipiosSelect(
                      provincia: context
                              .read<ProvinciasProvider>()
                              .provinciaSelected
                              ?.id ??
                          "",
                    ),
                  ),
                );
                if (mun != null) {
                  _municipiosSelected = mun;
                }
              } else {
                showMessage(
                  context,
                  locale.read('select_province_first'),
                  TypeMessage.ERROR,
                );
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

  void _showProvinciasSearch(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    await context
        .read<ProvinciasProvider>()
        .fetchAllProvincias()
        .then((value) async {
      _provinciaSelected = await showSearch(
        context: context,
        delegate: ProvinciasSearch(),
      );
    });
    _provinciasController.value =
        TextEditingValue(text: _provinciaSelected?.nombre ?? "");
  }

  void _handleRegister(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    if (!_formKey.currentState!.validate()) return;
    showMessage(context, locale.read('loading'), TypeMessage.LOADING);

    UserRegister userRegister = UserRegister(
      fullname: _fullNameController.text,
      country: _countrySelected,
      email: _emailController.text,
      phone: _phoneController.text,
      movil: _movilController.text,
      password: _password1Controller.text,
      confirmPassword: _password2Controller.text,
      provincia: _provinciaSelected!.id,
      municipios: _textMunicipiosId,
      acceptTerms: true,
    );
    APIUsers.common()
        .register(userRegister)
        .then((value) => _handleSuccsess(value, context))
        .catchError((e) => HandleError.logError(context, e));
  }

  void _handleSuccsess(User value, BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    showMessage(
      context,
      locale.read('success_register'),
      TypeMessage.ERROR,
    );
  }
}
