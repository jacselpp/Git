import 'package:json_annotation/json_annotation.dart';

part 'orders_model.g.dart';

@JsonSerializable()
class Orders {
  Orders({
    this.type,
    this.dest,
    this.discount,
    this.shippingDate,
    this.app,
    this.amount,
    this.currency,
    this.status,
    this.items = const [],
    this.description,
    this.shippingAddress,
    this.user,
    this.userType,
    this.payment,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? type;
  String? dest;
  int? discount;
  String? shippingDate;
  String? app;
  int? amount;
  String? currency;
  String? status;
  List<ItemElement> items = [];
  Description? description;
  ShippingAddress? shippingAddress;
  String? user;
  @JsonKey(name: 'user_type')
  String? userType;
  String? payment;
  String? createdAt;
  String? updatedAt;
  int? v;
  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

@JsonSerializable()
class Description {
  Description({
    this.short,
  });

  String? short;
  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
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
  Id? id;
  ItemItem? item;
  factory ItemElement.fromJson(Map<String, dynamic> json) =>
      _$ItemElementFromJson(json);
  Map<String, dynamic> toJson() => _$ItemElementToJson(this);
}

@JsonSerializable()
class Id {
  Id({
    this.oid,
  });

  String? oid;

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class ItemItem {
  ItemItem({
    this.name,
    this.price,
    this.description,
  });

  String? name;
  int? price;
  String? description;
  factory ItemItem.fromJson(Map<String, dynamic> json) =>
      _$ItemItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemItemToJson(this);
}

@JsonSerializable()
class ShippingAddress {
  ShippingAddress({
    this.alternative,
    this.id,
    this.user,
    this.nombre,
    this.apellidos,
    this.direccion,
    this.provincia,
    this.municipio,
    this.telefono,
    this.noIdentificacion,
    this.shippingAddressDefault,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.nombreCompleto,
    this.shippingAddressId,
  });

  Alternative? alternative;
  @JsonKey(name: '_id')
  String? id;
  String? user;
  String? nombre;
  String? apellidos;
  String? direccion;
  String? provincia;
  String? municipio;
  String? telefono;
  String? noIdentificacion;
  bool? shippingAddressDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? nombreCompleto;
  String? shippingAddressId;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}

@JsonSerializable()
class Alternative {
  Alternative({
    this.nombre,
    this.apellidos,
    this.noIdentificacion,
  });

  String? nombre;
  String? apellidos;
  String? noIdentificacion;

  factory Alternative.fromJson(Map<String, dynamic> json) =>
      _$AlternativeFromJson(json);
  Map<String, dynamic> toJson() => _$AlternativeToJson(this);
}
