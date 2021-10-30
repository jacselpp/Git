import 'package:flutter/material.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/utils/string_extensions.dart';

String getLocale({
  required BuildContext context,
  required String locale,
}) {
  final _locale = AppLocalizations.of(context)!;
  return _locale.read(locale);
}

String? validatePhone({String? value, required BuildContext context}) {
  if (!value!.isValidPhone) {
    return getLocale(context: context, locale: "invalid_phone_error");
  }
}

String? validatePhoneCubacel({String? value, required BuildContext context}) {
  if (!value!.isValidPhoneCubacel) {
    return getLocale(context: context, locale: "invalid_cubacel_phone_error");
  }
}

String? validateEmail({String? value, required BuildContext context}) {
  if (!value!.isValidEmail) {
    return getLocale(context: context, locale: "invalid_email_error");
  }
}

String? validateEmailNauta({String? value, required BuildContext context}) {
  if (!value!.isValidEmailNauta) {
    return getLocale(context: context, locale: "invalid_nauta_email_error");
  }
}

String? validatePassword({String? value, required BuildContext context}) {
  if (value!.length < 8) {
    return getLocale(context: context, locale: "password_to_short_error");
  }
}

String? validateIsNumeric({String? value, required BuildContext context}) {
  if (!value!.isNumeric) {
    return getLocale(context: context, locale: "only_numbers_error");
  } else if (value.length < 6) {
    return getLocale(context: context, locale: "numbers_too_short_error");
  } else if (value.length > 6) {
    return getLocale(context: context, locale: "numbers_too_long_error");
  }
}
