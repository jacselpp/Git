import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:detooo_recargas/services/stripe/stripe.dart';
import 'package:detooo_recargas/services/network/api_payments.dart';

class StripeKeyProvider extends ChangeNotifier {
  String? _stripeKey;

  String? get stripeKey => _stripeKey;

  Future<void> get fetchStripeKey async {
    await ApiPayments.common().getStripePublicKey().then((value) {
      setStripeKey(value);
    });
  }

  void setStripeKey(String stripeKey) {
    _stripeKey = stripeKey;
    if (!kIsWeb) StripeClass.initStripe(stripeKey);
    notifyListeners();
  }
}
