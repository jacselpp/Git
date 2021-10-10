// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipios_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Municipios _$MunicipiosFromJson(Map<String, dynamic> json) => Municipios(
      shopDelivery: json['shopDelivery'] as bool?,
      id: json['_id'] as String?,
      nombre: json['nombre'] as String?,
      provincia: json['provincia'] as String?,
    );

Map<String, dynamic> _$MunicipiosToJson(Municipios instance) =>
    <String, dynamic>{
      'shopDelivery': instance.shopDelivery,
      '_id': instance.id,
      'nombre': instance.nombre,
      'provincia': instance.provincia,
    };
