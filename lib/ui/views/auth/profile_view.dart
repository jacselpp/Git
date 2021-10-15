import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/layouts/home_layout.dart';
import 'package:detooo_recargas/utils/validators.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Profile? _profile;
  Country? _selectedCountry;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _movilController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _movilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        child: Column(
      children: [
        _buildAvatar(context),
        _buildBody(context),
      ],
    ));
  }

  Widget _buildBody(BuildContext context) {
    _profile = Provider.of<ProfileProvider>(context, listen: false).profile;

    _selectedCountry ??= _profile?.country;

    final locale = AppLocalizations.of(context)!;
    if (_profile != null) {
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
                  controller: _countryController,
                  label: locale.read('country'),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  controller: _emailController,
                  label: locale.read('email'),
                  validator: (value) => validateEmail(
                    context: context,
                    value: value,
                  ),
                ),
                _buildSeparation(),
                CustomTextFormField(
                  controller: _movilController,
                  label: locale.read('movil'),
                  validator: (value) => validatePhone(
                    context: context,
                    value: value,
                  ),
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

  void _handleUpdateProfile(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    _profile!.email = _emailController.text;
    _profile!.fullname = _fullnameController.text;
    _profile!.movil = _movilController.text;
    _profile!.country = _selectedCountry;

    UserRepository().updateProfile(_profile!, context);
  }
}
