// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currencies _$CurrenciesFromJson(Map<String, dynamic> json) => Currencies(
      totalCup: json['totalCup'] as int?,
      totalUsd: json['totalUsd'] as int?,
      totalMlc: json['totalMlc'] as int?,
    );

Map<String, dynamic> _$CurrenciesToJson(Currencies instance) =>
    <String, dynamic>{
      'totalCup': instance.totalCup,
      'totalUsd': instance.totalUsd,
      'totalMlc': instance.totalMlc,
    };
