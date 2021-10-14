// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      description: json['description'] == null
          ? null
          : Description.fromJson(json['description'] as Map<String, dynamic>),
      currency: json['currency'] as String?,
      isOffer: json['isOffer'] as bool?,
      isActive: json['isActive'] as bool?,
      id: json['_id'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      toSend: json['toSend'] as int?,
      type: json['type'] as String?,
      topDay: json['topDay'] as int?,
      topMonth: json['topMonth'] as int?,
      dest: json['dest'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'description': instance.description,
      'currency': instance.currency,
      'isOffer': instance.isOffer,
      'isActive': instance.isActive,
      '_id': instance.id,
      'price': instance.price,
      'toSend': instance.toSend,
      'type': instance.type,
      'topDay': instance.topDay,
      'topMonth': instance.topMonth,
      'dest': instance.dest,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
