import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/app/app_routes.dart';
import 'package:detooo_recargas/models/recargas/package_model.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class RecargaSuccesfully extends StatelessWidget {
  final String target;
  final Item package;
  const RecargaSuccesfully({
    Key? key,
    required this.target,
    required this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return HomeLayout(
      showBack: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: CustomContainer(
          paddingH: 0.0,
          paddingV: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Icon(
                    Icons.task_alt,
                    color: primaryColor,
                    size: 60.0,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    locale.read('purchase_success'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              CustomContainer(
                child: Container(),
                paddingV: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${package.type} ${locale.read('recharge')}'
                          .toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${package.type}: '.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' $target '.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                  color: primaryColor,
                                  backgroundColor: Paint().color =
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Monto: '.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' ${package.price} ${package.currency} '
                                .toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                  color: primaryColor,
                                  backgroundColor: Paint().color =
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextButton(
                          color: primaryColor,
                          label: 'Cerrar',
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.HOME,
                              (route) => false,
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
