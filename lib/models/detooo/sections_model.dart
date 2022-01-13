import 'package:json_annotation/json_annotation.dart';

part 'sections_model.g.dart';

@JsonSerializable()
class SectionsModel {
  SectionsModel({
    this.id,
    this.title,
    this.app,
    this.text,
  });

  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? app;
  String? text;
  factory SectionsModel.fromJson(Map<String, dynamic> json) =>
      _$SectionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionsModelToJson(this);
}
