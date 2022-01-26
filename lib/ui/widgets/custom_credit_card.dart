import 'package:auto_size_text/auto_size_text.dart';
import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    Key? key,
    required this.card,
  }) : super(key: key);
  final Data card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Center(
                            child: AutoSizeText(
                              '${card.card?.brand}'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor75),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              minFontSize: 12,
                              maxFontSize: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .fontSize!,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Separation(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.credit_card,
                            size: 36.0,
                          ),
                          Text(
                            'EXP: ${card.card!.expMonth! <= 9 ? '0${card.card?.expMonth}' : card.card?.expMonth}/${card.card?.expYear.toString().substring(2, 4)}',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: AutoSizeText(
                        '**** **** **** ${card.card?.last4}',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        minFontSize: 12,
                        maxFontSize:
                            Theme.of(context).textTheme.headline1!.fontSize!,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                const Separation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
