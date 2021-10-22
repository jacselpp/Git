// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_payments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardPayments _$DashboardPaymentsFromJson(Map<String, dynamic> json) =>
    DashboardPayments(
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
      anuncios: json['anuncios'] == null
          ? null
          : App.fromJson(json['anuncios'] as Map<String, dynamic>),
      recargas: json['recargas'] == null
          ? null
          : App.fromJson(json['recargas'] as Map<String, dynamic>),
      recargadores: json['recargadores'] == null
          ? null
          : App.fromJson(json['recargadores'] as Map<String, dynamic>),
      shop: json['shop'] == null
          ? null
          : App.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardPaymentsToJson(DashboardPayments instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'anuncios': instance.anuncios,
      'recargas': instance.recargas,
      'recargadores': instance.recargadores,
      'shop': instance.shop,
    };

App _$AppFromJson(Map<String, dynamic> json) => App(
      total: json['total'] as int?,
      cash: json['cash'] as int?,
      stripe: json['stripe'] as int?,
      currencies: json['currencies'] == null
          ? null
          : Currencies.fromJson(json['currencies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'total': instance.total,
      'cash': instance.cash,
      'stripe': instance.stripe,
      'currencies': instance.currencies,
    };
