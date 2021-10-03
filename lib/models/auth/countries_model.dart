import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'countries_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'country', primaryKeys: ['name'])
class Country {
  Country({
    this.callingCodes = const [],
    this.name,
    this.alpha2Code,
    this.alpha3Code,
    this.flag,
  });

  List<String> callingCodes = [];
  String? name;
  String? alpha2Code;
  String? alpha3Code;
  String? flag;
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
