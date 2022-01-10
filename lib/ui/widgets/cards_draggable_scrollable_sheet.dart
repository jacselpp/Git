import 'package:auto_size_text/auto_size_text.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/services/providers/user_cards_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDraggableScrollableSheet extends StatefulWidget {
  const CardDraggableScrollableSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDraggableScrollableSheet> createState() =>
      _CardDraggableScrollableSheetState();
}

class _CardDraggableScrollableSheetState
    extends State<CardDraggableScrollableSheet> {
  UserCards? _cards;
  List<CardS> userCards = [];

  @override
  Widget build(BuildContext context) {
    _cards ??= context.watch<UserCardsProvider>().cards;

    if (_cards?.data != null) {
      for (var item in _cards!.data!) {
        if (!userCards.any(
          (element) => element.fingerprint == item.card?.fingerprint,
        )) {}
        userCards.add(item.card!);
      }
    }

    final locale = AppLocalizations.of(context)!;
    return DraggableScrollableSheet(
      initialChildSize: 0.89,
      maxChildSize: 0.89,
      builder: (context, controller) => Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15.0),
            ),
            child: Container(
              color: Theme.of(context).cardColor,
              height: 40.0,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      locale.read('cards'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 0.0,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: _cards?.data != null && _cards!.data!.isNotEmpty
                  ? Container(
                      height: (ScreenHelper.screenHeight(context) * .89) - 40.0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userCards.length,
                        itemBuilder: _itemBuilder,
                      ),
                    )
                  : Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: !context.watch<UserCardsProvider>().loading
                            ? Text(
                                locale.read('no_cards'),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final card = userCards[index];
    return _buildCreditCard(context, card);
  }

  Widget _buildCreditCard(BuildContext context, CardS card) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Padding(
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
                                '${card.brand}'.toUpperCase(),
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
                              'EXP: ${card.expMonth! <= 9 ? '0${card.expMonth}' : card.expMonth}/${card.expYear.toString().substring(2, 4)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: AutoSizeText(
                          '**** **** **** ${card.last4}',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
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
      ),
    );
  }
}
