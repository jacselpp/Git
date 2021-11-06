import 'package:json_annotation/json_annotation.dart';
part 'orders_model.g.dart';

@JsonSerializable()
class Orders {
  Orders({
    this.type,
    this.dest,
    this.discount,
    this.shippingDate,
    this.id,
    this.app,
    this.amount,
    this.payment,
    this.currency,
    this.status,
    this.items,
    this.description,
    this.user,
    this.userType,
    this.createdAt,
    this.updatedAt,
  });

  String? type;
  String? dest;
  int? discount;
  String? shippingDate;
  @JsonKey(name: '_id')
  String? id;
  String? app;
  double? amount;
  String? payment;
  String? currency;
  String? status;
  List<ItemElement>? items;
  OrdersDescription? description;
  String? user;
  @JsonKey(name: 'user_type')
  String? userType;
  String? createdAt;
  String? updatedAt;

  factory Orders.fromJson(Map<String, dynamic> json) =>
      _$OrdersFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

@JsonSerializable()
class OrdersDescription {
  OrdersDescription({
    this.short,
    this.serverResponse,
    this.merchantTransactionId,
  });

  String? short;
  ServerResponse? serverResponse;
  String? merchantTransactionId;
  factory OrdersDescription.fromJson(Map<String, dynamic> json) =>
      _$OrdersDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersDescriptionToJson(this);
}

@JsonSerializable()
class ServerResponse {
  ServerResponse({
    this.transactionId,
    this.provisionStatus,
    this.description,
    this.apiDescription,
    this.noRecargado,
    this.reTryFailedTopUp,
  });

  String? transactionId;
  String? provisionStatus;
  String? description;
  String? apiDescription;
  String? noRecargado;
  bool? reTryFailedTopUp;
  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);
}

@JsonSerializable()
class ItemElement {
  ItemElement({
    this.qty,
    this.id,
    this.item,
  });

  int? qty;
  @JsonKey(name: '_id')
  String? id;
  ItemItem? item;
  factory ItemElement.fromJson(Map<String, dynamic> json) =>
      _$ItemElementFromJson(json);
  Map<String, dynamic> toJson() => _$ItemElementToJson(this);
}

@JsonSerializable()
class ItemItem {
  ItemItem({
    this.description,
    this.currency,
    this.isOffer,
    this.isActive,
    this.id,
    this.price,
    this.toSend,
    this.type,
    this.topDay,
    this.topMonth,
    this.dest,
    this.createdAt,
    this.updatedAt,
  });

  ItemDescription? description;
  String? currency;
  bool? isOffer;
  bool? isActive;
  @JsonKey(name: '_id')
  String? id;
  double? price;
  int? toSend;
  String? type;
  int? topDay;
  int? topMonth;
  String? dest;
  String? createdAt;
  String? updatedAt;

  factory ItemItem.fromJson(Map<String, dynamic> json) =>
      _$ItemItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemItemToJson(this);
}

@JsonSerializable()
class ItemDescription {
  ItemDescription({
    this.title,
    this.subtitle,
    this.description,
  });

  String? title;
  String? subtitle;
  String? description;

  factory ItemDescription.fromJson(Map<String, dynamic> json) =>
      _$ItemDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDescriptionToJson(this);
}
