import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/orders_model.dart';
import 'package:detooo_recargas/services/providers/history_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecargaSuccesfully extends StatelessWidget {
  const RecargaSuccesfully({
    Key? key,
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
              FutureBuilder(
                future: context.read<HistoryProvider>().fetchLastOrder(),
                builder: _buildFuture,
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

  Widget _buildFuture(BuildContext context, AsyncSnapshot<Orders> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (snapshot.hasData) {
      final DateTime _date = DateTime.parse(snapshot.data?.createdAt ?? "");
      return Column(
        children: [
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
                  '${snapshot.data?.id}',
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
                  '${snapshot.data?.description?.short} ',
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
                        text: ' ${snapshot.data?.dest}  ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                        text: ' ${snapshot.data?.status} '.toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                        text:
                            ' ${snapshot.data?.amount} ${snapshot.data?.currency} '
                                .toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: primaryColor,
                              backgroundColor: Paint().color =
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }
    return Container();
  }
}
