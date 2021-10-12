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
    this.avatar = '',
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
    this.accessToken,
    this.acceptTerms = true,
  });

  Country? country;
  List<String>? municipios;
  String? avatar = '';
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
  @JsonKey(name: "access_token")
  String? accessToken;
  bool? acceptTerms = true;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserRegister {
  UserRegister({
    this.country,
    this.fullname,
    this.email,
    this.movil,
    this.phone,
    this.provincia,
    this.municipios,
    this.password,
    this.confirmPassword,
    this.acceptTerms = true,
  });

  Country? country;
  List<String>? municipios;
  @JsonKey(name: "_id")
  String? id;
  String? fullname;
  String? email;
  String? movil;
  String? phone;
  String? provincia;
  String? password;
  String? confirmPassword;
  bool? acceptTerms = true;

  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}

@JsonSerializable()
class UserLogin {
  UserLogin({
    this.username,
    this.password,
  });

  String? username;

  String? password;

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
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
