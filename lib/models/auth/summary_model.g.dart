// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      total: json['Total'] as int?,
      status: json['Status'] == null
          ? null
          : Status.fromJson(json['Status'] as Map<String, dynamic>),
      currencies: json['Currencies'] == null
          ? null
          : Currencies.fromJson(json['Currencies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'Total': instance.total,
      'Status': instance.status,
      'Currencies': instance.currencies,
    };
