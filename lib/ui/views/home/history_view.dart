import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/views/home/history_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/models/recargas/orders_model.dart';
import 'package:detooo_recargas/services/providers/history_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final ScrollController _scrollController = ScrollController();
  BuildContext? _context;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HistoryProvider _prov = Provider.of<HistoryProvider>(context);
    final locale = AppLocalizations.of(context)!;
    _context ??= context;

    return HomeLayout(
      scrollController: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomContainer(
          paddingH: 0.0,
          paddingV: 0.0,
          child: Column(
            children: [
              if (_prov.orders.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      locale.read('history'),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              FutureBuilder(
                future: context.watch<HistoryProvider>().fetchOrdersPage(),
                initialData: const <Orders>[],
                builder: (BuildContext context,
                    AsyncSnapshot<List<Orders>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data!.isNotEmpty) {
                    return _buildItems(snapshot.data);
                  }

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data!.isEmpty) {
                    return _buildEmpty(context);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting &&
                      context.read<HistoryProvider>().orders.isNotEmpty) {
                    return Column(
                      children: [
                        _buildItems(snapshot.data),
                        _buildLoading(),
                      ],
                    );
                  } else {
                    return SizedBox(
                      width: ScreenHelper.screenWidth(context),
                      height: ScreenHelper.screenHeight(context) - 50.0,
                      child: _buildLoading(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItems(List<Orders>? data) {
    return ListView.builder(
      // controller: ,
      itemCount: context.watch<HistoryProvider>().orders.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(context.watch<HistoryProvider>().orders, index);
      },
    );
  }

  Widget _buildItem(List<Orders?> list, int index) {
Orders item = list[index]!;

    final DateTime _date = DateTime.parse(item.createdAt ?? "");

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HistoryDetails(item: item),
          ),
        );
      },
      child: Column(
        children: [
          Divider(
            color: Theme.of(context).cardTheme.shadowColor!,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: _handleIcon(item.status),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${item.description?.serverResponse?.transactionId}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '${item.amount} ${item.currency} - ${_date.toLocal()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.launch_sharp),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: SizedBox(
    //     width: ScreenHelper.screenWidth(context),
    //     // color: Colors.lime,
    //     child: Card(
    //       color: Theme.of(context).scaffoldBackgroundColor,
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Expanded(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         item.items![0].item!.description!.title!,
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: Theme.of(context).textTheme.headline6,
    //                       ),
    //                       Text(
    //                         '${item.items![0].item!.description!.subtitle}:\n${item.dest}',
    //                         maxLines: 2,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: Theme.of(context).textTheme.subtitle1,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Column(
    //                   children: [
    //                     _handleIcon(item.status),
    //                     Text('${item.amount} ${item.currency}'),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             const Divider(),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 8.0),
    //               child: Text(
    //                   '${locale.read('transaction_id')}: ${item.description?.serverResponse?.transactionId}'),
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                     '${locale.read('date')}: ${_date.year}-${_date.month}-${_date.day}'),
    //                 Text(
    //                     '${locale.read('time')}: ${_date.hour}:${_date.minute}'),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  void _scrollListener() {
    if ((_scrollController.position.maxScrollExtent - 50) <
        _scrollController.position.pixels) {
      _context?.read<HistoryProvider>().fetchOrdersPage();
    }
  }

  Widget _buildLoading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _handleIcon(String? status) {
    late Icon icon;
    switch (status) {
      case 'success':
        icon = const Icon(
          Icons.check,
          color: Colors.green,
          size: 36.0,
        );
        break;
      default:
        icon = const Icon(
          Icons.refresh,
          color: Colors.yellow,
        );
    }
    return icon;
  }

  Widget _buildEmpty(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return SizedBox(
      width: ScreenHelper.screenWidth(context),
      height: ScreenHelper.screenHeight(context) - 100.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              size: 48.0,
              color: Colors.yellow,
            ),
            Text(
              locale.read('no_history_to_show'),
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
