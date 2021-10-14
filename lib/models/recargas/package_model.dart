import 'package:json_annotation/json_annotation.dart';

import 'description_model.dart';

part 'package_model.g.dart';

@JsonSerializable()
class Item {
  Item({
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
    this.v,
  });

  Description? description;
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
  int? v;
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
