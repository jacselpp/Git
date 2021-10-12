// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      municipios: (json['municipios'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['5f10b9aed6c90e1c8c0920a8'],
      avatar: json['avatar'] as String?,
      role: (json['role'] as List<dynamic>?)?.map((e) => e as String).toList(),
      saldo: json['saldo'] as int?,
      isActive: json['isActive'] as bool?,
      publicInfo: (json['publicInfo'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      emailSubscriptions: (json['emailSubscriptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['_id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      movil: json['movil'] as String?,
      phone: json['phone'] as String?,
      provincia: json['provincia'] as String? ?? '5ed67a87af617d3cd4f36a76',
      stripeCustomerId: json['stripeCustomerId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      accessToken: json['access_token'] as String?,
      acceptTerms: json['acceptTerms'] as bool? ?? true,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    )..originType = json['origin_type'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'country': instance.country,
      'municipios': instance.municipios,
      'avatar': instance.avatar,
      'role': instance.role,
      'saldo': instance.saldo,
      'isActive': instance.isActive,
      'publicInfo': instance.publicInfo,
      'emailSubscriptions': instance.emailSubscriptions,
      '_id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'movil': instance.movil,
      'phone': instance.phone,
      'provincia': instance.provincia,
      'stripeCustomerId': instance.stripeCustomerId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'access_token': instance.accessToken,
      'acceptTerms': instance.acceptTerms,
      'origin_type': instance.originType,
    };

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) => UserRegister(
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      movil: json['movil'] as String?,
      phone: json['phone'] as String?,
      provincia: json['provincia'] as String?,
      municipios: (json['municipios'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      acceptTerms: json['acceptTerms'] as bool? ?? true,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) =>
    <String, dynamic>{
      'country': instance.country,
      'municipios': instance.municipios,
      '_id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'movil': instance.movil,
      'phone': instance.phone,
      'provincia': instance.provincia,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'acceptTerms': instance.acceptTerms,
    };

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

UserVerifyMovil _$UserVerifyMovilFromJson(Map<String, dynamic> json) =>
    UserVerifyMovil(
      userId: json['user_id'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$UserVerifyMovilToJson(UserVerifyMovil instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'code': instance.code,
    };
