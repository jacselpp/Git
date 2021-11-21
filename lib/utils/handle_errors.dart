import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/log_utils.dart';

class HandleError extends Error {
  //! seguir esta clase para ir manejando los errores
  static logError(BuildContext context, Object obj) {
    showLoadingBottomSheet(context, close: true);
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response?.data!;
        String message = handleMessage(res);
        showMessage(context, message, TypeMessage.ERROR);
        break;
      default:
        LogUtils().logError(obj.toString());
    }
  }

  static String handleMessage(res) {
    String message = "";
    try {
      res.forEach((key, value) {
        value.forEach((value) {
          if (message == "") {
            message = value;
          } else {
            message = "$message \n $value";
          }
        });
      });
    } catch (e) {
      message = res?['message'] ?? "";
    }
    return message;
  }
}
