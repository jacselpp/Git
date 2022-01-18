// import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';

Future<bool> checkConnectionStatus() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();

  return (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi ||
      result == ConnectivityResult.ethernet);
}
