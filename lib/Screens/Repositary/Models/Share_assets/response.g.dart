// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAssetsResponseImpl _$$GetAssetsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAssetsResponseImpl(
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$GetAssetsResponseImplToJson(
        _$GetAssetsResponseImpl instance) =>
    <String, dynamic>{
      'assets': instance.assets,
      'success': instance.success,
      'message': instance.message,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      category: json['category'] as String,
      assetList: (json['assetList'] as List<dynamic>)
          .map((e) => AssetList.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSelected: json['isSelected'] as bool?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'assetList': instance.assetList,
      'isSelected': instance.isSelected,
      'id': instance.id,
    };

_$AssetListImpl _$$AssetListImplFromJson(Map<String, dynamic> json) =>
    _$AssetListImpl(
      fieldName: json['fieldName'] as String,
      fieldValue: json['fieldValue'],
    );

Map<String, dynamic> _$$AssetListImplToJson(_$AssetListImpl instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldValue': instance.fieldValue,
    };
