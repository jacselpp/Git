import 'package:json_annotation/json_annotation.dart';

import 'currencies_model.dart';
import 'summary_model.dart';

part 'dashboard_payments_model.g.dart';

@JsonSerializable()
class DashboardPayments {
  DashboardPayments({
    this.summary,
    this.anuncios,
    this.recargas,
    this.recargadores,
    this.shop,
  });

  Summary? summary;
  App? anuncios;
  App? recargas;
  App? recargadores;
  App? shop;
  
  factory DashboardPayments.fromJson(Map<String, dynamic> json) => _$DashboardPaymentsFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardPaymentsToJson(this);
}

@JsonSerializable()
class App {
  App({
    this.total,
    this.cash,
    this.stripe,
    this.currencies,
  });

  int? total;
  int? cash;
  int? stripe;
  Currencies? currencies;

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
