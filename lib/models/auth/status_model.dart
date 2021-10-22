import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class Status {
  Status({
    this.created,
    this.success,
    this.pending,
    this.failed,
    this.refunded,
    this.delivered,
  });

  int? created;
  int? success;
  int? pending;
  int? failed;
  int? refunded;
  int? delivered;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}