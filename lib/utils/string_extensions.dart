// ignore_for_file: camel_case_extensions

import 'dart:ui';

extension extString on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    // final phoneRegExp = RegExp(r"^([\+])([0-9]{1,3}[0-9]{8,12})$");
    final phoneRegExp = RegExp(r"^([0-9]{8,12})$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPassWord {
    final phoneRegExp = RegExp(r"^([a-zA-Z]).{8,50}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isNumeric => !isEmpty && num.tryParse(this) != null;

  // bool get isValidName {
  //   final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  //   return nameRegExp.hasMatch(this);
  // }
}
