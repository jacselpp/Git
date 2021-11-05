import 'dart:async';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/ui/views/auth/login_view.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../app_ui.dart';

class ActivateUserView extends StatefulWidget {
  final String? id;
  const ActivateUserView(this.id, {Key? key}) : super(key: key);

  @override
  _ActivateUserViewState createState() => _ActivateUserViewState();
}

class _ActivateUserViewState extends State<ActivateUserView> {
  final TextEditingController _codeController = TextEditingController();
  bool _loading = false;
  int countDown = 0;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Column(
        children: [
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Card(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locale.read('confirm_account'),
                style: Theme.of(context).textTheme.headline5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  locale.read('phone_message_sent'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                controller: _codeController,
                label: locale.read('confirmation_code'),
                onChanged: (value) {
                  if (value != null && value.length == 6) {
                    _handleConfirm(locale, context);
                  }
                },
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
                      color: !_loading ? primaryColor : Colors.grey,
                      label: locale.read('activate_account'),
                      onPressed: !_loading
                          ? () => _handleConfirm(locale, context)
                          : () {},
                    ),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCountDown(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleConfirm(AppLocalizations locale, BuildContext context) async {
    setState(() {
      _loading = true;
    });
    showMessage(
      context,
      locale.read('loading'),
      TypeMessage.LOADING,
    );

    await APIUsers.common()
        .verifyMovil(UserVerifyMovil(
      userId: widget.id,
      code: _codeController.text,
    ))
        .then((value) {
      SharedPreference.removeUserId;
      Navigator.of(context)
          .pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => const LoginView(),
            ),
            (route) => false,
          )
          .catchError((e) => HandleError.logError(context, e));
    });
    setState(() {
      _loading = false;
    });
  }

  Widget _buildCountDown(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return CustomTextButton(
      color: (countDown == 0) ? primaryColor75 : Colors.grey,
      onPressed: (countDown == 0)
          ? () {
              _resendSMS(context);
            }
          : () {},
      label:
          '${!(countDown > 0) ? locale.read('resend_sms') : ''} ${countDown > 0 ? '0${(countDown / 60).floor()}:${countDown % 60 > 9 ? (countDown % 60) : '0${(countDown % 60)}'}' : ''} ',
    );
  }

  _resendSMS(BuildContext context) {
    _startCountDown();

    UserRepository().resendMovileCode(
      UserVerifyMovil(
        userId: widget.id,
      ),
      context,
    );
  }

  void _startCountDown() {
    setState(() {
      countDown = 11;
    });

    Timer.periodic(const Duration(seconds: 1), _handleTimer);
  }

  void _handleTimer(Timer timer) {
    setState(() {
      --countDown;
    });

    if (countDown == 0) {
      timer.cancel();
    }
  }
}
