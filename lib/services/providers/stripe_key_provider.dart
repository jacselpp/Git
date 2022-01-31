import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:detooo_recargas/utils/log_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:detooo_recargas/services/network/api_payments.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeKeyProvider extends ChangeNotifier {
  String? _stripeKey;

  String? get stripeKey => _stripeKey;

  Future<void> get fetchStripeKey async {
    String? stripeKey = SharedPreference.stripeKey;

    await ApiPayments.common().getStripePublicKey().then((value) async {
      LogUtils().logger.wtf(value.substring(1, value.length - 1));

      if (stripeKey != value) {
        SharedPreference.setStripeKey(value);
      }

      setStripeKey(value);
    }).catchError((e) => HandleError.logError(null, e));

    if (stripeKey != null) {
      await _initStripe();
    }
  }

  Future<void> _initStripe() async {
    if (!kIsWeb) {
      Stripe.publishableKey = SharedPreference.stripeKey!
          .substring(1, SharedPreference.stripeKey!.length - 1);
      Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
      Stripe.urlScheme = 'flutterstripe';
      await Stripe.instance.applySettings();
    }
  }

  void setStripeKey(String stripeKey) {
    _stripeKey = stripeKey;
    notifyListeners();
  }
}
