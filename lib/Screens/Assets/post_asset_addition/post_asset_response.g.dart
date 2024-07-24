// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_asset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostAssetResponseImpl _$$PostAssetResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostAssetResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      asset: Asset.fromJson(json['asset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostAssetResponseImplToJson(
        _$PostAssetResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'asset': instance.asset,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      assetId: (json['assetId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'userId': instance.userId,
      'category': instance.category,
    };
