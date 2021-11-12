// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCards _$UserCardsFromJson(Map<String, dynamic> json) => UserCards(
      object: json['object'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasMore: json['has_more'] as bool?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UserCardsToJson(UserCards instance) => <String, dynamic>{
      'object': instance.object,
      'data': instance.data,
      'has_more': instance.hasMore,
      'url': instance.url,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      object: json['object'] as String?,
      billingDetails: json['billing_details'] == null
          ? null
          : BillingDetails.fromJson(
              json['billing_details'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : CardS.fromJson(json['card'] as Map<String, dynamic>),
      created: json['created'] as int?,
      customer: json['customer'] as String?,
      livemode: json['livemode'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'billing_details': instance.billingDetails,
      'card': instance.card,
      'created': instance.created,
      'customer': instance.customer,
      'livemode': instance.livemode,
      'type': instance.type,
    };

BillingDetails _$BillingDetailsFromJson(Map<String, dynamic> json) =>
    BillingDetails(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$BillingDetailsToJson(BillingDetails instance) =>
    <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      city: json['city'] as String?,
      country: json['country'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      postalCode: json['postal_code'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'line1': instance.line1,
      'line2': instance.line2,
      'postal_code': instance.postalCode,
      'state': instance.state,
    };

CardS _$CardFromJson(Map<String, dynamic> json) => CardS(
      brand: json['brand'] as String?,
      checks: json['checks'] == null
          ? null
          : Checks.fromJson(json['checks'] as Map<String, dynamic>),
      country: json['country'] as String?,
      expMonth: json['exp_month'] as int?,
      expYear: json['exp_year'] as int?,
      fingerprint: json['fingerprint'] as String?,
      funding: json['funding'] as String?,
      generatedFrom: json['generated_from'] as String?,
      last4: json['last4'] as String?,
      networks: json['networks'] == null
          ? null
          : Networks.fromJson(json['networks'] as Map<String, dynamic>),
      threeDSecureUsage: json['three_d_secure_usage'] == null
          ? null
          : ThreeDSecureUsage.fromJson(
              json['three_d_secure_usage'] as Map<String, dynamic>),
      wallet: json['wallet'] as String?,
    );

Map<String, dynamic> _$CardToJson(CardS instance) => <String, dynamic>{
      'brand': instance.brand,
      'checks': instance.checks,
      'country': instance.country,
      'exp_month': instance.expMonth,
      'exp_year': instance.expYear,
      'fingerprint': instance.fingerprint,
      'funding': instance.funding,
      'generated_from': instance.generatedFrom,
      'last4': instance.last4,
      'networks': instance.networks,
      'three_d_secure_usage': instance.threeDSecureUsage,
      'wallet': instance.wallet,
    };

Checks _$ChecksFromJson(Map<String, dynamic> json) => Checks(
      addressLine1Check: json['address_line1_check'] as String?,
      addressPostalCodeCheck: json['address_postal_code_check'] as String?,
      cvcCheck: json['cvc_check'] as String?,
    );

Map<String, dynamic> _$ChecksToJson(Checks instance) => <String, dynamic>{
      'address_line1_check': instance.addressLine1Check,
      'address_postal_code_check': instance.addressPostalCodeCheck,
      'cvc_check': instance.cvcCheck,
    };

Networks _$NetworksFromJson(Map<String, dynamic> json) => Networks(
      available: (json['available'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NetworksToJson(Networks instance) => <String, dynamic>{
      'available': instance.available,
    };

ThreeDSecureUsage _$ThreeDSecureUsageFromJson(Map<String, dynamic> json) =>
    ThreeDSecureUsage(
      supported: json['supported'] as bool?,
    );

Map<String, dynamic> _$ThreeDSecureUsageToJson(ThreeDSecureUsage instance) =>
    <String, dynamic>{
      'supported': instance.supported,
    };
