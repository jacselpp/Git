import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'user', primaryKeys: ['id'])
class User {
  User({
    this.country,
    this.municipios,
    this.avatar,
    this.role,
    this.saldo,
    this.isActive,
    this.publicInfo = const [],
    this.emailSubscriptions = const [],
    this.id,
    this.fullname,
    this.email,
    this.movil,
    this.phone,
    this.provincia,
    this.stripeCustomerId,
    this.createdAt,
    this.updatedAt,
    this.password,
    this.accessToken,
  });

  Country? country;
  List<String>? municipios;
  String? avatar;
  List<String>? role;
  int? saldo;
  bool? isActive;
  List<String>? publicInfo = [];
  List<String>? emailSubscriptions = [];
  @JsonKey(name: "_id")
  String? id;
  String? fullname;
  String? email;
  String? movil;
  String? phone;
  String? provincia;
  String? stripeCustomerId;
  String? createdAt;
  String? updatedAt;
  String? password;
  @JsonKey(name: "access_token")
  String? accessToken;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
