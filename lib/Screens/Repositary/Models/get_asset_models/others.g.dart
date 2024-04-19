// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'others.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherResponseImpl _$$OtherResponseImplFromJson(Map<String, dynamic> json) =>
    _$OtherResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Other.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OtherResponseImplToJson(_$OtherResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$OtherImpl _$$OtherImplFromJson(Map<String, dynamic> json) => _$OtherImpl(
      category: json['category'] as String,
      assetName: json['assetName'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$OtherImplToJson(_$OtherImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'assetName': instance.assetName,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
