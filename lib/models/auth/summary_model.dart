import 'package:json_annotation/json_annotation.dart';

import 'status_model.dart';
import 'currencies_model.dart';

part 'summary_model.g.dart';

@JsonSerializable()
class Summary {
  Summary({
    this.total,
    this.status,
    this.currencies,
  });

  int? total;
  Status? status;
  Currencies? currencies;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
