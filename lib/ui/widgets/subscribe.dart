import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/providers/subscriptions_provider.dart';

import '../app_ui.dart';

class Subscribe extends StatelessWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSubscribe(context);
  }

  Widget _buildSubscribe(BuildContext context) {
    bool subscribed = context.watch<SubscriptionsProvider>().subscribed;

    final locale = AppLocalizations.of(context)!;
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.read('last_promotions'),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
        Text(
          locale.read('last_promotions_subtitle'),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
      ],
    );
    var buttom = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextButton(
        color: Theme.of(context).scaffoldBackgroundColor,
        label: locale.read('subscribe_now'),
        textColor: Theme.of(context).textTheme.bodyText1!.color,
        onPressed: () {
          APIUsers.common().userSubscribe(
            {"subscription": "promo_recargas"},
          ).then((_) {
            showMessage(
                context, locale.read('subscribed_message'), TypeMessage.INFO);
            context.read<SubscriptionsProvider>().setSubscribed(true);
          });
          context
              .read<SubscriptionsProvider>()
              .setSubscribed(context.read<SubscriptionsProvider>().subscribed);
        },
      ),
    );
    return !subscribed
        ? Positioned(
            bottom: 20.0,
            child: Padding(
              padding: EdgeInsets.all(ScreenHelper.screenWidth(context) * .02),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: primaryColor,
                ),
                width: ScreenHelper.screenWidth(context) * .96,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScreenHelper.isPortrait(context)
                      ? Column(
                          children: [
                            column,
                            buttom,
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3, child: column),
                            Expanded(child: buttom),
                          ],
                        ),
                ),
              ),
            ),
          )
        : Container();
  }
}
