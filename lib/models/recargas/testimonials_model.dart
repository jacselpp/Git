import 'package:json_annotation/json_annotation.dart';

part 'testimonials_model.g.dart';

@JsonSerializable()
class Testimonials {
  Testimonials({
    this.app,
    this.rating,
    this.isVisible,
    this.id,
    this.text,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? app;
  int? rating;
  bool? isVisible;
  @JsonKey(name: '_id')
  String? id;
  String? text;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? v;
  factory Testimonials.fromJson(Map<String, dynamic> json) =>
      _$TestimonialsFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonialsToJson(this);
}
