// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      type: json['type'] as String?,
      dest: json['dest'] as String?,
      discount: json['discount'] as int?,
      shippingDate: json['shippingDate'] as String?,
      app: json['app'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      status: json['status'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ItemElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] == null
          ? null
          : Description.fromJson(json['description'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      user: json['user'] as String?,
      userType: json['user_type'] as String?,
      payment: json['payment'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'type': instance.type,
      'dest': instance.dest,
      'discount': instance.discount,
      'shippingDate': instance.shippingDate,
      'app': instance.app,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
      'items': instance.items,
      'description': instance.description,
      'shippingAddress': instance.shippingAddress,
      'user': instance.user,
      'user_type': instance.userType,
      'payment': instance.payment,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      short: json['short'] as String?,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'short': instance.short,
    };

ItemElement _$ItemElementFromJson(Map<String, dynamic> json) => ItemElement(
      qty: json['qty'] as int?,
      id: json['_id'] == null
          ? null
          : Id.fromJson(json['_id'] as Map<String, dynamic>),
      item: json['item'] == null
          ? null
          : ItemItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemElementToJson(ItemElement instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      '_id': instance.id,
      'item': instance.item,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      oid: json['oid'] as String?,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'oid': instance.oid,
    };

ItemItem _$ItemItemFromJson(Map<String, dynamic> json) => ItemItem(
      name: json['name'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemItemToJson(ItemItem instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      alternative: json['alternative'] == null
          ? null
          : Alternative.fromJson(json['alternative'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      user: json['user'] as String?,
      nombre: json['nombre'] as String?,
      apellidos: json['apellidos'] as String?,
      direccion: json['direccion'] as String?,
      provincia: json['provincia'] as String?,
      municipio: json['municipio'] as String?,
      telefono: json['telefono'] as String?,
      noIdentificacion: json['noIdentificacion'] as String?,
      shippingAddressDefault: json['shippingAddressDefault'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int?,
      nombreCompleto: json['nombreCompleto'] as String?,
      shippingAddressId: json['shippingAddressId'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'alternative': instance.alternative,
      '_id': instance.id,
      'user': instance.user,
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
      'direccion': instance.direccion,
      'provincia': instance.provincia,
      'municipio': instance.municipio,
      'telefono': instance.telefono,
      'noIdentificacion': instance.noIdentificacion,
      'shippingAddressDefault': instance.shippingAddressDefault,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
      'nombreCompleto': instance.nombreCompleto,
      'shippingAddressId': instance.shippingAddressId,
    };

Alternative _$AlternativeFromJson(Map<String, dynamic> json) => Alternative(
      nombre: json['nombre'] as String?,
      apellidos: json['apellidos'] as String?,
      noIdentificacion: json['noIdentificacion'] as String?,
    );

Map<String, dynamic> _$AlternativeToJson(Alternative instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
      'noIdentificacion': instance.noIdentificacion,
    };
