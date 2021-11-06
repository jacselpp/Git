import 'package:detooo_recargas/models/recargas/orders_model.dart';
import 'package:detooo_recargas/services/providers/history_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _context ??= context;
    return HomeLayout(
      scrollController: _scrollController,
      child: Container(
        color: Theme.of(context).cardColor,
        child: FutureBuilder(
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: ScreenHelper.screenWidth(context),
        height: 100,
        color: Colors.lime,
        child: Text('$index'),
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
}
