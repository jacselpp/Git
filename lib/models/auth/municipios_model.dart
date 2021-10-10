import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'municipios_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'municipios', primaryKeys: ['id'])
class Municipios {
  Municipios({
    this.shopDelivery,
    this.id,
    this.nombre,
    this.provincia,
  });

  bool? shopDelivery;
  @JsonKey(name: "_id")
  String? id;
  String? nombre;
  String? provincia;

  factory Municipios.fromJson(Map<String, dynamic> json) =>
      _$MunicipiosFromJson(json);
  Map<String, dynamic> toJson() => _$MunicipiosToJson(this);
}
