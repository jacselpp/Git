import 'package:json_annotation/json_annotation.dart';

part 'promotions_model.g.dart';

@JsonSerializable()
class Promotions {
  Promotions({
    this.app,
    this.caracteristicas,
    this.id,
    this.titulo,
    this.fechaInicio,
    this.fechaFin,
    this.dest,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? app;
  List<String>? caracteristicas;
  @JsonKey(name: '_id')
  String? id;
  String? titulo;
  String? fechaInicio;
  String? fechaFin;
  String? dest;
  double? amount;
  String? createdAt;
  String? updatedAt;
  int? v;
  factory Promotions.fromJson(Map<String, dynamic> json) =>
      _$PromotionsFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionsToJson(this);
}
