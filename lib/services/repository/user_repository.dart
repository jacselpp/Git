import 'package:detooo_recargas/app/app_connectivity.dart';
import 'package:detooo_recargas/ui/views/auth/activate_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/routes.dart';

class UserRepository {
  Future<bool> _networkStatus() async => await checkConnectionStatus();
  AppLocalizations? _locale;

  void _handleNetwork(Future<void> function, context) async {
    showMessage(
      context,
      _locale!.read('loading'),
      TypeMessage.LOADING,
    );
    if (await _networkStatus()) {
      showMessage(
          context, _locale!.read('no_network_error'), TypeMessage.ERROR);
    } else {
      function;
    }
  }

  void _handleLocale(BuildContext context) {
    _locale ??= AppLocalizations.of(context)!;
  }

  void logout() {
    SharedPreference.deleteUserKey;
    NavigatorProvider().navigatorKeyState.pushReplacementNamed(Routes.LOGIN);
  }

  void login(User userLogin, BuildContext context) {
    _handleLocale(context);
    _handleNetwork(
      APIUsers.common().login(userLogin).then((value) {
        SharedPreference.saveUserKey(value.accessToken!);
        context.read<ProfileProvider>().setProfile(value.user!);
        showMessage(context, _locale!.read('done_login'), TypeMessage.INFO);

        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      }).catchError((e) => HandleError.logError(context, e)),
      context,
    );
  }

  void register(User userRegister, BuildContext context) {
    _handleLocale(context);
    _handleNetwork(
        APIUsers.common().register(userRegister).then((value) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => ActivateUserView(value.id!),
            ),
            (w) => false,
          );
          showMessage(
            context,
            _locale!.read('success_register'),
            TypeMessage.ERROR,
          );
        }).catchError((e) => HandleError.logError(context, e)),
        context);
  }

  void updateProfile(Profile profile, BuildContext context) {
    _handleLocale(context);
    _handleNetwork(
      APIUsers.common().updateProfile(profile).then((value) {
        context.read<ProfileProvider>().setProfile(value);
        showMessage(
          context,
          _locale!.read('success_update_profile'),
          TypeMessage.ERROR,
        );
      }).catchError((e) => HandleError.logError(context, e)),
      context,
    );
  }

  void changePassword(UserPassword userPassword, BuildContext context) {
    _handleLocale(context);
    _handleNetwork(
      APIUsers.common().changePassword(userPassword).then((value) {
        showMessage(
          context,
          _locale!.read('success_change_password'),
          TypeMessage.ERROR,
        );
      }).catchError((e) => HandleError.logError(context, e)),
      context,
    );
  }

  void forgotPassword(User userEmail, BuildContext context) {
    _handleLocale(context);
    _handleNetwork(
      APIUsers.common().passwordReset(userEmail).then((value) {
        showMessage(
          context,
          _locale!.read('success_password_reset'),
          TypeMessage.ERROR,
        );
      }).catchError((e) => HandleError.logError(context, e)),
      context,
    );
  }
}
