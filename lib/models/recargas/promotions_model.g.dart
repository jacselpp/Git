// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotions _$PromotionsFromJson(Map<String, dynamic> json) => Promotions(
      app: json['app'] as String?,
      caracteristicas: (json['caracteristicas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'] as String?,
      titulo: json['titulo'] as String?,
      fechaInicio: json['fechaInicio'] as String?,
      fechaFin: json['fechaFin'] as String?,
      dest: json['dest'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$PromotionsToJson(Promotions instance) =>
    <String, dynamic>{
      'app': instance.app,
      'caracteristicas': instance.caracteristicas,
      '_id': instance.id,
      'titulo': instance.titulo,
      'fechaInicio': instance.fechaInicio,
      'fechaFin': instance.fechaFin,
      'dest': instance.dest,
      'amount': instance.amount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
