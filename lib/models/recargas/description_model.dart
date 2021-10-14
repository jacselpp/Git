import 'package:json_annotation/json_annotation.dart';

part 'description_model.g.dart';

@JsonSerializable()
class Description {
  Description({
    this.title,
    this.subtitle,
    this.description,
  });

  String? title;
  String? subtitle;
  String? description;
  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
