import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provincias_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'provincias', primaryKeys: ['id'])
class Provincias {
  Provincias({
    this.id,
    this.nombre,
    this.slug,
  });

  @JsonKey(name: "_id")
  String? id;
  String? nombre;
  String? slug;

  factory Provincias.fromJson(Map<String, dynamic> json) =>
      _$ProvinciasFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinciasToJson(this);
}
