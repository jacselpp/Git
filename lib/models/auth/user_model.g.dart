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
          .toList(),
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
      provincia: json['provincia'] as String?,
      stripeCustomerId: json['stripeCustomerId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      password: json['password'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
      'password': instance.password,
      'access_token': instance.accessToken,
    };
