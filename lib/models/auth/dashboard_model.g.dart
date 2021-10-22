// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      summary: json['Summary'] == null
          ? null
          : Summary.fromJson(json['Summary'] as Map<String, dynamic>),
      anuncios: json['anuncios'] == null
          ? null
          : Anuncios.fromJson(json['anuncios'] as Map<String, dynamic>),
      recargas: json['recargas'] == null
          ? null
          : Recarga.fromJson(json['recargas'] as Map<String, dynamic>),
      recargadores: json['recargadores'] == null
          ? null
          : Recarga.fromJson(json['recargadores'] as Map<String, dynamic>),
      shop: json['shop'] == null
          ? null
          : Anuncios.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'Summary': instance.summary,
      'anuncios': instance.anuncios,
      'recargas': instance.recargas,
      'recargadores': instance.recargadores,
      'shop': instance.shop,
    };

Anuncios _$AnunciosFromJson(Map<String, dynamic> json) => Anuncios(
      total: json['total'] as int?,
      status: json['Status'] == null
          ? null
          : Status.fromJson(json['Status'] as Map<String, dynamic>),
      currencies: json['Currencies'] == null
          ? null
          : Currencies.fromJson(json['Currencies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnunciosToJson(Anuncios instance) => <String, dynamic>{
      'total': instance.total,
      'Status': instance.status,
      'Currencies': instance.currencies,
    };

Recarga _$RecargaFromJson(Map<String, dynamic> json) => Recarga(
      total: json['total'] as int?,
      status: json['Status'] == null
          ? null
          : Status.fromJson(json['Status'] as Map<String, dynamic>),
      currencies: json['Currencies'] == null
          ? null
          : Currencies.fromJson(json['Currencies'] as Map<String, dynamic>),
      cubacel: json['Cubacel'] == null
          ? null
          : Summary.fromJson(json['Cubacel'] as Map<String, dynamic>),
      nauta: json['Nauta'] == null
          ? null
          : Summary.fromJson(json['Nauta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecargaToJson(Recarga instance) => <String, dynamic>{
      'total': instance.total,
      'Status': instance.status,
      'Currencies': instance.currencies,
      'Cubacel': instance.cubacel,
      'Nauta': instance.nauta,
    };
