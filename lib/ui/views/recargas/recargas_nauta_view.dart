import 'package:auto_size_text/auto_size_text.dart';
import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/services/providers/user_cards_provider.dart';
import 'package:detooo_recargas/ui/widgets/credit_card_button.dart';
import 'package:detooo_recargas/ui/widgets/custom_credit_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';

class RecargasNautaView extends StatefulWidget {
  const RecargasNautaView({Key? key}) : super(key: key);

  @override
  _RecargasNautaViewState createState() => _RecargasNautaViewState();
}

class _RecargasNautaViewState extends State<RecargasNautaView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nautaAccountController = TextEditingController();
  String? _dropDownValue;
  Promotions _selectedPromotion = Promotions();
  bool _accept = false;
  EmailContact? _emailContact;
  UserCards? _userCards;
  CardS? _selectedUserCards;

  void _handleAccept() {
    setState(() {
      _accept = !_accept;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_emailContact != null) {
      _nautaAccountController.value = TextEditingValue(
        text: _emailContact!.email!.email!,
      );
    }

    if (context.watch<PackagesProvider>().pack.isNotEmpty) {
      _handlePromotion(context.watch<PackagesProvider>().pack,
          context.watch<PackagesProvider>().pack[0].amount.toString());
    } else {
      return const CircularProgressIndicator();
    }

    _setUserCards(context);

    _selectedUserCards = context.watch<UserCardsProvider>().selectedCard;

    return AlternativeHomeLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SvgPicture.asset('assets/images/11.svg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        locale.read('nauta_recharge'),
                        style: Theme.of(context).textTheme.headline5!,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        minFontSize: 12,
                        maxFontSize:
                            Theme.of(context).textTheme.headline4!.fontSize!,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCaracteristicas(
                  _selectedPromotion.caracteristicas,
                  context,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: _selectedUserCards != null
                      ? Hero(
                          tag: _selectedUserCards?.fingerprint ?? '',
                          child: CustomCreditCard(
                            card: _selectedUserCards!,
                          ),
                        )
                      : Container(),
                ),
                CustomCreditCardButon(),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextFormField(
              controller: _nautaAccountController,
              label: locale.read('nauta_account'),
              validator: (value) => validateEmailNauta(
                context: context,
                value: value,
              ),
              suffixIcon: IconButton(
                onPressed: () async {
                  final bool granted = !kIsWeb
                      ? await FlutterContactPicker.requestPermission()
                      : false;
                  if (granted) {
                    final EmailContact? contact =
                        await FlutterContactPicker.pickEmailContact();
                    if (contact != null) {
                      setState(() {
                        _emailContact = contact;
                      });
                    }
                  }
                },
                icon: const Icon(
                  Icons.contact_mail_rounded,
                  color: primaryColor,
                ),
              ),
              onChanged: (v) {
                setState(() {
                  _emailContact = null;
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 45.0,
              child: CustomDropdown(
                items: _handleResults(context.watch<PackagesProvider>().pack),
                label: locale.read('package'),
                onChanged: (String? value) {
                  _handlePromotion(
                    context.read<PackagesProvider>().pack,
                    value!,
                  );
                  setState(() {
                    _dropDownValue = value;
                  });
                },
                value: _dropDownValue,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Switch(
                    activeColor: primaryColor,
                    value: _accept,
                    onChanged: (e) => _handleAccept(),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    locale.read('accept_therms_recharge'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextButton(
                    color: primaryColor,
                    label: locale.read('recharge'),
                    onPressed: _handleSubmit,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> _handleResults(List<Promotions> pack) {
    List<String> packages = [];
    for (var promotion in pack) {
      if (promotion.dest == 'nauta') {
        packages.add(promotion.amount!.toString());
      }
    }
    _dropDownValue ??= packages[0];
    if (_selectedPromotion.amount == null) {
      _handlePromotion(
        pack,
        packages[0],
      );
    }
    return packages;
  }

  void _handlePromotion(List<Promotions> pack, String value) {
    for (var promotion in pack) {
      if (promotion.amount.toString() == value && promotion.dest == 'nauta') {
        _selectedPromotion = promotion;
      }
    }
  }

  Widget _buildCaracteristicas(
    List<String>? caracteristicas,
    BuildContext context,
  ) {
    String caracteristicasString = '          ';
    if (caracteristicas != null) {
      for (var caracteristica in caracteristicas) {
        caracteristicasString = '$caracteristicasString $caracteristica +';
      }
    }
    return Text(
      caracteristicasString
          .replaceRange(caracteristicasString.length - 1,
              caracteristicasString.length, '')
          .trim(),
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
    );
  }

  void _handleSubmit() {
    final locale = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    if (!_accept) {
      showMessage(context, locale.read('should_accept'), TypeMessage.ERROR);
      return;
    }
  }

  void _setUserCards(BuildContext context) async {
    _userCards ??= await Future.delayed(const Duration(milliseconds: 100),
        () => context.read<UserCardsProvider>().userCards);
  }
}
