import 'package:flutter_stripe/flutter_stripe.dart';

class StripeClass {
  static initStripe(String stripePublishableKey) async {
    Stripe.publishableKey = stripePublishableKey;
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
  }
}
