import 'dart:io';

import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/providers/subscriptions_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/services/providers/countries_provider.dart';
import 'package:detooo_recargas/utils/search/country_search_delegate.dart';
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
      ),
    );
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
                Row(
                  children: [
                    Expanded(
                      child: SwitchListTile(
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
              borderRadius: BorderRadius.circular(10.0),
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
                child: GestureDetector(
                  onTap: _handleAvatar,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 60.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            context.watch<ProfileProvider>().profile!.avatar!),
                      ),
                      SizedBox(
                        width: 115.0,
                        height: 115.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(
                                  Icons.camera_alt_rounded,
                                  color: primaryColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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

    _profile!.emailSubscriptions = [];
    _profile!.email = _emailController.text;
    _profile!.fullname = _fullnameController.text;
    _profile!.movil = _movilController.text;
    _profile!.country = _selectedCountry;

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

  void _handleAvatar() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await showDialog(
      context: context,
      builder: (ctx) => dialogProfileImage(
        context,
        selectFromGallery: () async {
          Navigator.of(ctx).pop(
            await _picker.pickImage(
              source: ImageSource.gallery,
              maxWidth: 720.0,
            ),
          );
        },
        selectFromCamera: () async {
          Navigator.of(ctx).pop(
            await _picker.pickImage(
              source: ImageSource.camera,
              maxWidth: 720.0,
            ),
          );
        },
      ),
    );

    if (image != null) {
      final _data = FormData();

      _data.files.add(
        MapEntry(
          'avatar',
          MultipartFile.fromFileSync(
            image.path,
            filename: image.path.split(Platform.pathSeparator).last,
          ),
        ),
      );

      dioCommon().patch(
        'https://api.v2.users.detooo.com/profile/update_avatar',
        options: Options(headers: {'Accept': 'multipart/form-data'}),
        data: _data,
      );
    }
  }
}
