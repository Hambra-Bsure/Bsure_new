// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'will_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WillStateImpl _$$WillStateImplFromJson(Map<String, dynamic> json) =>
    _$WillStateImpl(
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      sameDistributionCheckbox:
          json['sameDistributionCheckbox'] as bool? ?? false,
    );

Map<String, dynamic> _$$WillStateImplToJson(_$WillStateImpl instance) =>
    <String, dynamic>{
      'assets': instance.assets,
      'sameDistributionCheckbox': instance.sameDistributionCheckbox,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      assetId: json['assetId'] as int,
      assetName: json['assetName'] as String,
      assetIdentity: json['assetIdentity'] as String?,
      categoryId: json['categoryId'] as int,
      equalDistributionCheckbox:
          json['equalDistributionCheckbox'] as bool? ?? false,
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
      'equalDistributionCheckbox': instance.equalDistributionCheckbox,
      'nominees': instance.nominees,
    };

_$NomineeImpl _$$NomineeImplFromJson(Map<String, dynamic> json) =>
    _$NomineeImpl(
      id: json['id'] as int,
      mobile: json['mobile'] as String,
      relation: json['relation'] as String,
      name: json['name'] as String,
      share: (json['share'] as num).toDouble(),
      equalShareCheckbox: json['equalShareCheckbox'] ?? false,
    );

Map<String, dynamic> _$$NomineeImplToJson(_$NomineeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'relation': instance.relation,
      'name': instance.name,
      'share': instance.share,
      'equalShareCheckbox': instance.equalShareCheckbox,
    };
