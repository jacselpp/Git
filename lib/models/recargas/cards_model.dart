import 'package:json_annotation/json_annotation.dart';

part 'cards_model.g.dart';

@JsonSerializable()
class UserCards {
  UserCards({
    this.object,
    this.data = const [],
    this.hasMore,
    this.url,
  });

  String? object;
  List<Data>? data = [];
  @JsonKey(name: 'has_more')
  bool? hasMore;
  String? url;
  factory UserCards.fromJson(Map<String, dynamic> json) =>
      _$UserCardsFromJson(json);
  Map<String, dynamic> toJson() => _$UserCardsToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.object,
    this.billingDetails,
    this.card,
    this.created,
    this.customer,
    this.livemode,
    // this.metadata,
    this.type,
  });

  String? id;
  String? object;
  @JsonKey(name: 'billing_details')
  BillingDetails? billingDetails;
  CardS? card;
  int? created;
  String? customer;
  bool? livemode;
  // Metadata? metadata;
  String? type;
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class BillingDetails {
  BillingDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
  });

  Address? address;
  String? email;
  String? name;
  String? phone;
  factory BillingDetails.fromJson(Map<String, dynamic> json) =>
      _$BillingDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BillingDetailsToJson(this);
}

@JsonSerializable()
class Address {
  Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
  });

  String? city;
  String? country;
  String? line1;
  String? line2;
  @JsonKey(name: 'postal_code')
  String? postalCode;
  String? state;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class CardS {
  CardS({
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.generatedFrom,
    this.last4,
    this.networks,
    this.threeDSecureUsage,
    this.wallet,
  });

  String? brand;
  Checks? checks;
  String? country;
  @JsonKey(name: 'exp_month')
  int? expMonth;
  @JsonKey(name: 'exp_year')
  int? expYear;
  String? fingerprint;
  String? funding;
  @JsonKey(name: 'generated_from')
  String? generatedFrom;
  String? last4;
  Networks? networks;
  @JsonKey(name: 'three_d_secure_usage')
  ThreeDSecureUsage? threeDSecureUsage;
  String? wallet;

  factory CardS.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}

@JsonSerializable()
class Checks {
  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  @JsonKey(name: 'address_line1_check')
  String? addressLine1Check;
  @JsonKey(name: 'address_postal_code_check')
  String? addressPostalCodeCheck;
  @JsonKey(name: 'cvc_check')
  String? cvcCheck;

  factory Checks.fromJson(Map<String, dynamic> json) => _$ChecksFromJson(json);
  Map<String, dynamic> toJson() => _$ChecksToJson(this);
}

@JsonSerializable()
class Networks {
  Networks({
    this.available,
    // this.preferred,
  });

  List<String>? available;
  // Str preferred;

  factory Networks.fromJson(Map<String, dynamic> json) =>
      _$NetworksFromJson(json);
  Map<String, dynamic> toJson() => _$NetworksToJson(this);
}

@JsonSerializable()
class ThreeDSecureUsage {
  ThreeDSecureUsage({
    this.supported,
  });

  bool? supported;

  factory ThreeDSecureUsage.fromJson(Map<String, dynamic> json) =>
      _$ThreeDSecureUsageFromJson(json);
  Map<String, dynamic> toJson() => _$ThreeDSecureUsageToJson(this);
}

// @JsonSerializable()
// class Metadata {
//     Metadata();
// }
