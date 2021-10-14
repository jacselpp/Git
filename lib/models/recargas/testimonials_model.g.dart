// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Testimonials _$TestimonialsFromJson(Map<String, dynamic> json) => Testimonials(
      app: json['app'] as String?,
      rating: json['rating'] as int?,
      isVisible: json['isVisible'] as bool?,
      id: json['_id'] as String?,
      text: json['text'] as String?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$TestimonialsToJson(Testimonials instance) =>
    <String, dynamic>{
      'app': instance.app,
      'rating': instance.rating,
      'isVisible': instance.isVisible,
      '_id': instance.id,
      'text': instance.text,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
