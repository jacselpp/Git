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
      username: json['username'] as String?,
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
    )
      ..source = json['source'] as String?
      ..originType = json['origin_type'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'password': instance.password,
      'source': instance.source,
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
      'username': instance.username,
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

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      municipios: (json['municipios'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      movil: json['movil'] as String?,
      role:
          (json['role'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      saldo: json['saldo'] as int?,
      isActive: json['isActive'] as bool?,
      publicInfo: (json['publicInfo'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      emailSubscriptions: (json['emailSubscriptions'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      id: json['_id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      provincia: json['provincia'] as String?,
      stripeCustomerId: json['stripeCustomerId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'country': instance.country,
      'municipios': instance.municipios,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'movil': instance.movil,
      'role': instance.role,
      'saldo': instance.saldo,
      'isActive': instance.isActive,
      'publicInfo': instance.publicInfo,
      'emailSubscriptions': instance.emailSubscriptions,
      '_id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'provincia': instance.provincia,
      'stripeCustomerId': instance.stripeCustomerId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin(
      user: json['user'] == null
          ? null
          : Profile.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
    };

UserPassword _$UserPasswordFromJson(Map<String, dynamic> json) => UserPassword(
      oldPassword: json['oldPassword'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$UserPasswordToJson(UserPassword instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
