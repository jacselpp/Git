import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  User({
    this.country,
    this.municipios = const ['5f10b9aed6c90e1c8c0920a8'],
    this.avatar,
    this.role,
    this.saldo,
    this.isActive,
    this.publicInfo = const [],
    this.emailSubscriptions = const [],
    this.id,
    this.fullname,
    this.email,
    this.username,
    this.movil,
    this.phone,
    this.provincia = '5ed67a87af617d3cd4f36a76',
    this.stripeCustomerId,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
    this.acceptTerms = true,
    this.password,
    this.confirmPassword,
  });
  String? password;
  String? confirmPassword;
  Country? country;
  List<String>? municipios = ['5f10b9aed6c90e1c8c0920a8'];
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
  String? username;
  String? movil;
  String? phone;
  String? provincia = '5ed67a87af617d3cd4f36a76';
  String? stripeCustomerId;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: "access_token")
  String? accessToken;
  bool? acceptTerms = true;
  @JsonKey(name: 'origin_type')
  String originType = 'movil';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserVerifyMovil {
  UserVerifyMovil({
    this.userId,
    this.code,
  });

  @JsonKey(name: 'user_id')
  String? userId;

  String? code;

  factory UserVerifyMovil.fromJson(Map<String, dynamic> json) =>
      _$UserVerifyMovilFromJson(json);
  Map<String, dynamic> toJson() => _$UserVerifyMovilToJson(this);
}

@JsonSerializable()
class Profile {
  Profile({
    this.country,
    this.municipios = const [],
    this.avatar,
    this.phone,
    this.movil,
    this.role = const [],
    this.saldo,
    this.isActive,
    this.publicInfo = const [],
    this.emailSubscriptions = const [],
    this.id,
    this.fullname,
    this.email,
    this.provincia,
    this.stripeCustomerId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Country? country;
  List<String>? municipios = [];
  String? avatar;
  String? phone;
  String? movil;
  List<String>? role = [];
  int? saldo;
  bool? isActive;
  List<String>? publicInfo = [];
  List<String>? emailSubscriptions = [];
  @JsonKey(name: '_id')
  String? id;
  String? fullname;
  String? email;
  String? provincia;
  String? stripeCustomerId;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class UserLogin {
  UserLogin({
    this.user,
    this.accessToken,
  });

  Profile? user;
  @JsonKey(name: 'access_token')
  String? accessToken;

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}
