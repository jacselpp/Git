import 'package:detooo_recargas/models/recargas/orders_model.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class HistoryDetails extends StatelessWidget {
  final Orders item;
  const HistoryDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime _date = DateTime.parse(item.createdAt ?? "");
    return HomeLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: CustomContainer(
          paddingH: 0.0,
          paddingV: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Detalles',
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
                      'Número de la Orden',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${item.id}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Fecha de Creación',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_date.toLocal()}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Descripción: ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${item.description?.short} ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Destino: ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' ${item.dest}  ',
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
                            text: 'Estado: ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' ${item.status} '.toUpperCase(),
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
                            text: 'Monto: ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' ${item.amount} ${item.currency} '
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
                            Navigator.of(context).pop();
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
