// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:async';

import 'package:detooo_recargas/services/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/log_utils.dart';

import '../shared_preference.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onRequest(options, handler) async {
    String? header, body = '';
    options.headers.forEach((key, v) => header = ('- $key: $v'));
    options.data.forEach((key, v) {
      if (v != null) body = body! + ('\n $key: $v, ');
    });

    LogUtils().logInfo('*** API REQUEST - START ***\n\n' +
        'URL: ${options.uri.toString()}\n' +
        'METHOD: ${options.method.toString()}\n' +
        'HEADER: \n$header\n\n' +
        'BODY: $body\n\n' +
        '*** API REQUEST - END ***');

    return handler.next(options);
  }

  @override
  Future onError(DioError err, handler) async {
    LogUtils().logError('*** API ERROR - START ***\n\n' +
        'URL: ${err.requestOptions.uri.toString()}\n' +
        'STATUS CODE: ${err.response?.statusCode.toString()}\n\n' +
        'BODY: ${HandleError.handleMessage(err.response?.data!)}\n\n' +
        '*** API ERROR - END ***');
    return handler.next(err);
  }

  @override
  Future onResponse(response, handler) async {
    LogUtils().logWarning('*** API RESPONSE - START ***\n\n' +
        'URL: ${response.requestOptions.uri.toString()}\n' +
        'STATUS CODE: ${response.statusCode.toString()}\n' +
        'REDIRECT: ${response.isRedirect.toString()}\n\n' +
        'BODY: ${response.data.toString()}\n\n' +
        '*** API RESPONSE - END ***');
    return handler.next(response);
  }
}

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(options, handler) async {
    String? _userKey = SharedPreference.readUserKey;
    if (_userKey != null) {
      options.headers.addAll(
        {'Authorization': 'Bearer $_userKey'},
      );
    }

    return handler.next(options);
  }

  // {detail: Invalid token.}
  @override
  Future onError(DioError err, handler) async {
    if (err.response?.statusCode! == 401) {
      UserRepository().logout();
    }
    return handler.next(err);
  }
}
