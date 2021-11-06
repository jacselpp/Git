import 'package:detooo_recargas/app/app_localizations.dart';
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
    final locale = AppLocalizations.of(context)!;
    _context ??= context;
    return HomeLayout(
      scrollController: _scrollController,
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                locale.read('history'),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            FutureBuilder(
              future: context.watch<HistoryProvider>().fetchOrdersPage(),
              initialData: const <Orders>[],
              builder:
                  (BuildContext context, AsyncSnapshot<List<Orders>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return _buildItems(snapshot.data);
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
                  return _buildLoading();
                }
              },
            ),
          ],
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
    final locale = AppLocalizations.of(context)!;
    Orders item = list[index]!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: ScreenHelper.screenWidth(context),
        // color: Colors.lime,
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.items![0].item!.description!.title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            '${item.items![0].item!.description!.subtitle}: ${item.dest}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        _handleIcon(item.status),
                        Text('${item.amount} ${item.currency}'),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${locale.read('date')}: ${item.createdAt!.split('T')[0]}'),
                    Text(
                        '${locale.read('time')}: ${item.createdAt!.split('T')[1].split('Z')[0]}'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
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
          Icons.check_circle,
          color: Colors.green,
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
}
