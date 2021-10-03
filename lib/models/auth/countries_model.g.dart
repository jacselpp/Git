// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      callingCodes: (json['callingCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      name: json['name'] as String?,
      alpha2Code: json['alpha2Code'] as String?,
      alpha3Code: json['alpha3Code'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'callingCodes': instance.callingCodes,
      'name': instance.name,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'flag': instance.flag,
    };
