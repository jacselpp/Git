// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
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
      'summary': instance.summary,
      'anuncios': instance.anuncios,
      'recargas': instance.recargas,
      'recargadores': instance.recargadores,
      'shop': instance.shop,
    };

Anuncios _$AnunciosFromJson(Map<String, dynamic> json) => Anuncios(
      total: json['total'] as int?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      currencies: json['currencies'] == null
          ? null
          : Currencies.fromJson(json['currencies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnunciosToJson(Anuncios instance) => <String, dynamic>{
      'total': instance.total,
      'status': instance.status,
      'currencies': instance.currencies,
    };

Recarga _$RecargaFromJson(Map<String, dynamic> json) => Recarga(
      total: json['total'] as int?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      currencies: json['currencies'] == null
          ? null
          : Currencies.fromJson(json['currencies'] as Map<String, dynamic>),
      cubacel: json['cubacel'] == null
          ? null
          : Summary.fromJson(json['cubacel'] as Map<String, dynamic>),
      nauta: json['nauta'] == null
          ? null
          : Summary.fromJson(json['nauta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecargaToJson(Recarga instance) => <String, dynamic>{
      'total': instance.total,
      'status': instance.status,
      'currencies': instance.currencies,
      'cubacel': instance.cubacel,
      'nauta': instance.nauta,
    };
