// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionsModel _$SectionsModelFromJson(Map<String, dynamic> json) =>
    SectionsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      app: json['app'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$SectionsModelToJson(SectionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'app': instance.app,
      'text': instance.text,
    };
