// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'will_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WillResponseImpl _$$WillResponseImplFromJson(Map<String, dynamic> json) =>
    _$WillResponseImpl(
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WillResponseImplToJson(_$WillResponseImpl instance) =>
    <String, dynamic>{
      'assets': instance.assets,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      assetId: (json['assetId'] as num).toInt(),
      assetName: json['assetName'] as String,
      assetIdentity: json['assetIdentity'] as String?,
      categoryId: (json['categoryId'] as num).toInt(),
      equalShareCheckbox: json['equalShareCheckbox'] as bool? ?? false,
      nominees: (json['nominees'] as List<dynamic>)
          .map((e) => Nominee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'assetName': instance.assetName,
      'assetIdentity': instance.assetIdentity,
      'categoryId': instance.categoryId,
      'equalShareCheckbox': instance.equalShareCheckbox,
      'nominees': instance.nominees,
    };

_$NomineeImpl _$$NomineeImplFromJson(Map<String, dynamic> json) =>
    _$NomineeImpl(
      id: (json['id'] as num).toInt(),
      mobile: json['mobile'] as String,
      relation: json['relation'] as String,
      name: json['name'] as String,
      share: (json['share'] as num).toDouble(),
    );

Map<String, dynamic> _$$NomineeImplToJson(_$NomineeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'relation': instance.relation,
      'name': instance.name,
      'share': instance.share,
    };
