// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currencies _$CurrenciesFromJson(Map<String, dynamic> json) => Currencies(
      totalCup: json['totalCUP'] as int?,
      totalUsd: json['totalUSD'] as int?,
      totalMlc: json['totalMLC'] as int?,
    );

Map<String, dynamic> _$CurrenciesToJson(Currencies instance) =>
    <String, dynamic>{
      'totalCUP': instance.totalCup,
      'totalUSD': instance.totalUsd,
      'totalMLC': instance.totalMlc,
    };
