// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NPSResponseImpl _$$NPSResponseImplFromJson(Map<String, dynamic> json) =>
    _$NPSResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => NPS.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NPSResponseImplToJson(_$NPSResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$NPSImpl _$$NPSImplFromJson(Map<String, dynamic> json) => _$NPSImpl(
      category: json['category'] as String,
      pranNumber: json['pranNumber'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$NPSImplToJson(_$NPSImpl instance) => <String, dynamic>{
      'category': instance.category,
      'pranNumber': instance.pranNumber,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
