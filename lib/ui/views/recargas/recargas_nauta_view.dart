import 'package:flutter/material.dart';
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
  Promotions? _selectedPromotion;
  bool _accept = false;

  void _handleAccept() {
    setState(() {
      _accept = !_accept;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.read('nauta_recharge'),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline5,
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
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 45.0,
                  child: CustomDropdown(
                    items:
                        _handleResults(context.watch<PackagesProvider>().pack),
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
                Card(
                  margin: const EdgeInsets.all(0.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child:
                                  SvgPicture.asset('assets/images/Icon_5.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedPromotion!.titulo!,
                                style: Theme.of(context).textTheme.headline5,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const Divider(),
                              _buildCaracteristicas(
                                _selectedPromotion!.caracteristicas!,
                                context,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
    if (_selectedPromotion == null) {
      _handlePromotion(
        pack,
        packages[0],
      );
    }
    return packages;
  }

  void _handlePromotion(List<Promotions> pack, String value) {
    for (var promotion in pack) {
      if (promotion.amount.toString() == value) {
        _selectedPromotion = promotion;
      }
    }
  }

  Widget _buildCaracteristicas(
      List<String> caracteristicas, BuildContext context) {
    String caracteristicasString = '';
    for (var caracteristica in caracteristicas) {
      caracteristicasString = '$caracteristicasString $caracteristica \n';
    }
    return Text(
      caracteristicasString,
      style: Theme.of(context).textTheme.bodyText2,
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
}
