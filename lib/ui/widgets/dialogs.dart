// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:detooo_recargas/app/app_localizations.dart';

import '../app_ui.dart';

//! SNACKBARS
enum TypeMessage { ERROR, INFO, LOADING }

void showMessage(BuildContext context, String message, TypeMessage type) {
  SnackBar snack;
  switch (type) {
    case TypeMessage.ERROR:
      snack = messageSnack(
        message,
        Colors.red,
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        2,
      );
      break;
    case TypeMessage.INFO:
      snack = messageSnack(
        message,
        Colors.green,
        const Icon(
          Icons.info,
          color: Colors.white,
        ),
        2,
      );
      break;
    case TypeMessage.LOADING:
      snack = messageSnack(
        message,
        primaryColor,
        Container(
          padding: const EdgeInsets.all(4.0),
          child: const CircularProgressIndicator(
            strokeWidth: 4.0,
          ),
        ),
        10,
      );
      break;
    default:
      snack = messageSnack(
        message,
        Colors.green,
        const Icon(
          Icons.info,
          color: Colors.white,
        ),
        2,
      );
  }
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(snack);
}

SnackBar messageSnack(String text, Color color, Widget icon, int duration) {
  return SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(horizontal: 1.0),
    content: Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(0.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 6.00),
              child: icon,
            ),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ),
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

AlertDialog dialogProfileImage(
  BuildContext context, {
  VoidCallback? selectFromGallery,
  VoidCallback? selectFromCamera,
}) {
  final locale = AppLocalizations.of(context)!;

  return AlertDialog(
    title: Text(locale.read('dialog_profile').toUpperCase()),
    content: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: selectFromCamera,
            child: const Icon(
              Icons.add_a_photo,
              size: 36.0,
              color: primaryColor,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: selectFromGallery,
            child: const Icon(
              Icons.image,
              size: 50.0,
              color: primaryColor,
            ),
          ),
        ),
      ],
    ),
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
