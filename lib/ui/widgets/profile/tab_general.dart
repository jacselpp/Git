import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/ui/views/auth/municipios_view.dart';
import 'package:detooo_recargas/ui/widgets/profile/tab_avatar.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/utils/search/country_search_delegate.dart';
import 'package:detooo_recargas/services/providers/countries_provider.dart';
import 'package:detooo_recargas/services/providers/municipios_provider.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';
import 'package:detooo_recargas/utils/search/provincias_search_delegate.dart';
import 'package:detooo_recargas/services/providers/subscriptions_provider.dart';

class TabGeneral extends StatefulWidget {
  const TabGeneral({Key? key}) : super(key: key);

  @override
  _TabGeneralState createState() => _TabGeneralState();
}

class _TabGeneralState extends State<TabGeneral> {
  Profile? _profile;
  Country? _selectedCountry;
  List<Municipios>? _selectedMunicipios;
  Provincias? _selectedProvincia;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _movilController = TextEditingController();
  final TextEditingController _provinciaController = TextEditingController();
  final TextEditingController _municipiosController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _movilController.dispose();
    _provinciaController.dispose();
    _municipiosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_profile != null) {
      _selectedProvincia ??= context
          .watch<ProvinciasProvider>()
          .fetchProvincia(_profile!.provincia!);
    }

    return SingleChildScrollView(
      child: ScreenHelper.isPortrait(context)
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AvatarTab(),
                    ),
                  ),
                ),
                _buildBody(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AvatarTab(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _buildBody(context),
                  flex: 2,
                ),
              ],
            ),
    );
  }

  Widget _buildBody(BuildContext context) {
    _profile = Provider.of<ProfileProvider>(context, listen: true).profile;

    _selectedCountry ??= _profile?.country;

    final locale = AppLocalizations.of(context)!;

    if (_profile != null) {
      _selectedMunicipios ??
          Timer(
            const Duration(seconds: 1),
            _handleFillMunicipios,
          );

      _selectedMunicipios ??=
          context.watch<MunicipiosProvider>().municipiosSelected;

      _fullnameController.value = TextEditingValue(
        text: _profile?.fullname ?? '',
      );
      _countryController.value = TextEditingValue(
        text: _selectedCountry?.name ?? '',
      );
      _emailController.value = TextEditingValue(
        text: _profile?.email ?? '',
      );
      _movilController.value = TextEditingValue(
        text: _profile?.movil ?? '',
      );

      _provinciaController.value = TextEditingValue(
        text: _selectedProvincia?.nombre ??
            context
                .watch<ProvinciasProvider>()
                .fetchProvincia(_profile!.provincia!)
                ?.nombre ??
            '',
      );

      _municipiosController.value = TextEditingValue(
        text: _handleMunicipalitiesSelectedName(
          _selectedMunicipios ??
              context.watch<MunicipiosProvider>().municipiosSelected,
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _fullnameController,
                  label: locale.read('fullname'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _showSearch(context);
                  },
                  controller: _countryController,
                  label: locale.read('country'),
                  suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  controller: _emailController,
                  label: locale.read('email'),
                  validator: (value) => validateEmail(
                    context: context,
                    value: value,
                  ),
                  suffixIcon: _publicInfo(locale, 'email'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  controller: _movilController,
                  label: locale.read('movil'),
                  validator: (value) => validatePhone(
                    context: context,
                    value: value,
                  ),
                  suffixIcon: _publicInfo(locale, 'movil'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  controller: _provinciaController,
                  label: locale.read('provincia'),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _showSearchProvince();
                  },
                  readOnly: true,
                  suffixIcon: _publicInfo(locale, 'provincia'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  controller: _municipiosController,
                  label: locale.read('municipios'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return locale.read('select_municipality_error');
                    }
                  },
                  readOnly: true,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MunicipiosSelect(
                          provincia:
                              _selectedProvincia?.id ?? _profile!.provincia!,
                        ),
                      ),
                    );
                  },
                  suffixIcon: _publicInfo(locale, 'municipios'),
                ),
                _buildSeparation(),
                Row(
                  children: [
                    Expanded(
                      child: SwitchListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(locale.read('subscribe')),
                        activeColor: primaryColor,
                        onChanged: (bool value) {
                          if (value) {
                            APIUsers.common().userSubscribe(
                              {"subscription": "promo_recargas"},
                            ).then((_) {
                              showMessage(
                                  context,
                                  locale.read('subscribed_message'),
                                  TypeMessage.INFO);
                            });
                            _profile?.emailSubscriptions.add('promo_recargas');
                          } else {
                            APIUsers.common().userUnsubscribe(
                              {"subscription": "promo_recargas"},
                            ).then((_) {
                              showMessage(
                                  context,
                                  locale.read('unsubscribed_message'),
                                  TypeMessage.INFO);
                            });
                            _profile?.emailSubscriptions
                                .remove('promo_recargas');
                          }
                          context
                              .read<SubscriptionsProvider>()
                              .setSubscribed(value);
                          _handleUpdateProfile(context);
                        },
                        value:
                            context.watch<SubscriptionsProvider>().subscribed,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const Divider(),
                _buildSeparation(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextButton(
                        color: primaryColor,
                        label: locale.read('update_profile'),
                        onPressed: () {
                          _handleUpdateProfile(context);
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
    );
  }

  Padding _publicInfo(AppLocalizations locale, String field) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale.read('public_info'),
            style: const TextStyle(
              fontSize: 10.0,
            ),
          ),
          Checkbox(
            value: _profile!.publicInfo.any((element) => element == field),
            onChanged: (element) {
              if (element!) {
                if (_profile?.publicInfo != null) {
                  _profile?.publicInfo.add(field);
                }
              } else {
                _profile?.publicInfo.remove(field);
              }
              setState(() {});
            },
            activeColor: primaryColor,
            splashRadius: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSeparation() {
    return const SizedBox(
      height: 20.0,
    );
  }

  void _handleUpdateProfile(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    _profile!.emailSubscriptions = [];
    _profile!.email = _emailController.text;
    _profile!.fullname = _fullnameController.text;
    _profile!.movil = _movilController.text;
    _profile!.country = _selectedCountry;
    _profile!.provincia = _selectedProvincia?.id ?? _profile!.provincia;
    _profile!.municipios = _selectedMunicipios!.map((e) => e.id!).toList();

    UserRepository().updateProfile(_profile!, context);
  }

  void _showSearch(BuildContext context) async {
    await context
        .read<CountriesProvider>()
        .fetchAllCountries()
        .then((value) async {
      Country? selectedCountry = await showSearch(
        context: context,
        delegate: CountrySearch(),
      );
      if (selectedCountry?.name != null) {
        _selectedCountry = selectedCountry;
      }
    });
    setState(() {});
  }

  String _handleMunicipalitiesSelectedName(
    List<Municipios> municipiosSelected,
  ) {
    String municipiosSelectedName = '';
    for (var municipio in municipiosSelected) {
      municipiosSelectedName = '$municipiosSelectedName ${municipio.nombre},';
    }
    return municipiosSelectedName.substring(
      0,
      municipiosSelectedName.isNotEmpty ? municipiosSelectedName.length - 1 : 0,
    );
  }

  void _showSearchProvince() async {
    _selectedProvincia = await showSearch(
      context: context,
      delegate: ProvinciasSearch(),
    );
  }

  void _handleFillMunicipios() {
    context.read<MunicipiosProvider>().setUserMunicipiosSelected(
          _profile!.municipios!,
          _profile!.provincia!,
        );
  }
}
