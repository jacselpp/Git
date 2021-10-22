import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/providers/dashboard_provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<String>? _dashboardList = [];
  Map<String, dynamic>? _dashboard;

  @override
  Widget build(BuildContext context) {
    return HomeLayout(child: _buildBody());
  }

  Widget _buildBody() {
    _dashboard = context.watch<DashboardProvider>().dashboard?.toJson();
    if (_dashboard == null) {
      context.read<DashboardProvider>().fetchDashboard();
      return SizedBox(
        height: ScreenHelper.screenHeight(context),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 4.0,
          ),
        ),
      );
    } else {
      _dashboard!.forEach((key, value) {
        _dashboardList!.add(key);
      });
    }

    return _buildGridInfo();
  }

  Widget _buildGridInfo() {
    return SizedBox(
      width: ScreenHelper.screenHeight(context) - 100.0,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: ScreenHelper.isPortrait(context) ? 300.0 : 350.0,
          crossAxisCount: ScreenHelper.isPortrait(context) ? 1 : 2,
        ),
        itemCount: _dashboard!.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_dashboardList?[index].toUpperCase() ?? ''),
              const Divider(),
              const SizedBox(
                height: 10.0,
              ),
              _handleContent(_dashboard?[_dashboardList?[index]].toJson()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _handleContent(Map<String, dynamic> json) {
    final locale = AppLocalizations.of(context)!;
    Map<String, double> _dataMap = {};

    json['Currencies'].toJson().forEach((key, value) {
      _dataMap.addAll({'$key'.substring(5): double.parse(value.toString())});
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(locale.read('currencies')),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: PieChart(
                chartType: ChartType.ring,
                chartRadius: 100.0,
                ringStrokeWidth: 15.0,
                dataMap: _dataMap,
                legendOptions:
                    const LegendOptions(legendPosition: LegendPosition.left
                        // showLegendsInRow: true,
                        ),
              ),
            ),
            Expanded(
              child: PieChart(
                chartType: ChartType.ring,
                chartRadius: 100.0,
                dataMap: _dataMap,
                ringStrokeWidth: 15.0,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.right,
                  // showLegendsInRow: true,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('${locale.read('total')}: ${json['Total'] ?? json['total']}'),
          ],
        ),
      ],
    );
  }
}
