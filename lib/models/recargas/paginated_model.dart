import 'package:json_annotation/json_annotation.dart';

part 'paginated_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginated<T> {
  Paginated({
    this.total,
    this.totalPages,
    this.currentPage,
    this.items,
  });

  int? total;
  int? totalPages;
  int? currentPage;
  List<T>? items;

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(
    Paginated<T> instance,
    Object? Function(T value) toJsonT,
  ) =>
      _$PaginatedToJson(this, toJsonT);
}
