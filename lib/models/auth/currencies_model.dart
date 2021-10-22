import 'package:json_annotation/json_annotation.dart';

part 'currencies_model.g.dart';

@JsonSerializable()
class Currencies {
  Currencies({
    this.totalCup,
    this.totalUsd,
    this.totalMlc,
  });

  int? totalCup;
  int? totalUsd;
  int? totalMlc;

  factory Currencies.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesFromJson(json);
  Map<String, dynamic> toJson() => _$CurrenciesToJson(this);
}
