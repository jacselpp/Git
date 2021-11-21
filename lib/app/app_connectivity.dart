// import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';

Future<bool> checkConnectionStatus() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  // final bool response = !kIsWeb
  //     ? await InternetAddress.lookup('https://api.v2.users.detooo.com/')
  //         .then((value) => value.isNotEmpty)
  //     : true;
  return (result != ConnectivityResult.mobile &&
          result != ConnectivityResult.wifi
      // response
      );
}
