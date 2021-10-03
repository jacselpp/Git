// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:detooo_recargas/app/app_localizations.dart';

//! SNACKBARS
enum TypeMessage { ERROR, INFO }

void showMessage(BuildContext context, String message, TypeMessage type) {
  SnackBar snack;
  switch (type) {
    case TypeMessage.ERROR:
      snack = messageSnack(message, Colors.red, Icons.error);
      break;
    case TypeMessage.INFO:
      snack = messageSnack(message, Colors.green, Icons.info);
      break;
    default:
      snack = messageSnack(message, Colors.green, Icons.info);
  }
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(snack);
}

void showLoading(BuildContext context) {
  SnackBar snack = loadingSnack(Colors.black, null);
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(snack);
}

SnackBar messageSnack(String text, Color color, IconData? icon) {
  return SnackBar(
    backgroundColor: color,
    content: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 6.00),
          child: Icon(icon ?? Icons.info, color: Colors.white),
        ),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}

SnackBar loadingSnack(Color color, IconData? icon) {
  return SnackBar(
    backgroundColor: color,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(
          width: 25.0,
          height: 25.0,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ],
    ),
    duration: const Duration(minutes: 1),
  );
}

AlertDialog dialogExit(BuildContext context, {VoidCallback? onAccept}) {
  final locale = AppLocalizations.of(context)!;
  return AlertDialog(
    title: Text(locale.read('dialog_exit_title').toUpperCase()),
    content: Text(locale.read('dialog_exit_message')),
    actions: [
      TextButton(
        child: Text(locale.read('dialog_cancel')),
        onPressed: () => Navigator.of(context).pop(false),
      ),
      TextButton(
        child: Text(locale.read('dialog_accept')),
        onPressed: () => exit(1),
      ),
    ],
  );
}

AlertDialog dialogLogout(BuildContext context, {VoidCallback? onAccept}) {
  final locale = AppLocalizations.of(context)!;

  return AlertDialog(
    title: Text(locale.read('dialog_exit_title').toUpperCase()),
    content: Text(locale.read('dialog_logout_message')),
    actions: [
      TextButton(
        child: Text(locale.read('dialog_cancel')),
        onPressed: () => Navigator.of(context).pop(false),
      ),
      TextButton(
        child: Text(locale.read('dialog_accept')),
        onPressed: () {},
      ),
    ],
  );
}

void showLoadingBottomSheet(BuildContext context,
    {VoidCallback? onPressed, bool close = false}) {
  final locale = AppLocalizations.of(context)!;

  close
      ? Navigator.canPop(context)
      : showModalBottomSheet(
          context: context,
          isDismissible: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: const CircularProgressIndicator(),
              title: Text(locale.read('dialog_loading_text')),
              // trailing: TextButton(
              //   child: Text(locale.read('dialog_cancel').toUpperCase()),
              //   onPressed: () => onPressed ?? Navigator.pop(context),
              // ),
            ),
          ),
        );
}
