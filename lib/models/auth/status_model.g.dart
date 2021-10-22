// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      created: json['created'] as int?,
      success: json['success'] as int?,
      pending: json['pending'] as int?,
      failed: json['failed'] as int?,
      refunded: json['refunded'] as int?,
      delivered: json['delivered'] as int?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'created': instance.created,
      'success': instance.success,
      'pending': instance.pending,
      'failed': instance.failed,
      'refunded': instance.refunded,
      'delivered': instance.delivered,
    };
