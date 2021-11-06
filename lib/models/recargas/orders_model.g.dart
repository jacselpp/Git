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
      id: json['_id'] as String?,
      app: json['app'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      payment: json['payment'] as String?,
      currency: json['currency'] as String?,
      status: json['status'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] == null
          ? null
          : OrdersDescription.fromJson(
              json['description'] as Map<String, dynamic>),
      user: json['user'] as String?,
      userType: json['user_type'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'type': instance.type,
      'dest': instance.dest,
      'discount': instance.discount,
      'shippingDate': instance.shippingDate,
      '_id': instance.id,
      'app': instance.app,
      'amount': instance.amount,
      'payment': instance.payment,
      'currency': instance.currency,
      'status': instance.status,
      'items': instance.items,
      'description': instance.description,
      'user': instance.user,
      'user_type': instance.userType,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

OrdersDescription _$OrdersDescriptionFromJson(Map<String, dynamic> json) =>
    OrdersDescription(
      short: json['short'] as String?,
      serverResponse: json['serverResponse'] == null
          ? null
          : ServerResponse.fromJson(
              json['serverResponse'] as Map<String, dynamic>),
      merchantTransactionId: json['merchantTransactionId'] as String?,
    );

Map<String, dynamic> _$OrdersDescriptionToJson(OrdersDescription instance) =>
    <String, dynamic>{
      'short': instance.short,
      'serverResponse': instance.serverResponse,
      'merchantTransactionId': instance.merchantTransactionId,
    };

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) =>
    ServerResponse(
      transactionId: json['transactionId'] as String?,
      provisionStatus: json['provisionStatus'] as String?,
      description: json['description'] as String?,
      apiDescription: json['apiDescription'] as String?,
      noRecargado: json['noRecargado'] as String?,
      reTryFailedTopUp: json['reTryFailedTopUp'] as bool?,
    );

Map<String, dynamic> _$ServerResponseToJson(ServerResponse instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'provisionStatus': instance.provisionStatus,
      'description': instance.description,
      'apiDescription': instance.apiDescription,
      'noRecargado': instance.noRecargado,
      'reTryFailedTopUp': instance.reTryFailedTopUp,
    };

ItemElement _$ItemElementFromJson(Map<String, dynamic> json) => ItemElement(
      qty: json['qty'] as int?,
      id: json['_id'] as String?,
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

ItemItem _$ItemItemFromJson(Map<String, dynamic> json) => ItemItem(
      description: json['description'] == null
          ? null
          : ItemDescription.fromJson(
              json['description'] as Map<String, dynamic>),
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
    );

Map<String, dynamic> _$ItemItemToJson(ItemItem instance) => <String, dynamic>{
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
    };

ItemDescription _$ItemDescriptionFromJson(Map<String, dynamic> json) =>
    ItemDescription(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemDescriptionToJson(ItemDescription instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
    };
