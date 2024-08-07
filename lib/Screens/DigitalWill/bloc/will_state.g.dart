// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'will_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WillStateImpl _$$WillStateImplFromJson(Map<String, dynamic> json) =>
    _$WillStateImpl(
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Asset>[],
      sameDistributionCheckbox:
          json['sameDistributionCheckbox'] as bool? ?? false,
    );

Map<String, dynamic> _$$WillStateImplToJson(_$WillStateImpl instance) =>
    <String, dynamic>{
      'assets': instance.assets,
      'sameDistributionCheckbox': instance.sameDistributionCheckbox,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      assetId: (json['assetId'] as num).toInt(),
      category: json['category'] as String,
      equalDistributionCheckbox:
          json['equalDistributionCheckbox'] as bool? ?? false,
      nominees: (json['nominees'] as List<dynamic>?)
              ?.map((e) => Nominee.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Nominee>[],
      details: (json['details'] as List<dynamic>?)
              ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Detail>[],
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'category': instance.category,
      'equalDistributionCheckbox': instance.equalDistributionCheckbox,
      'nominees': instance.nominees,
      'details': instance.details,
    };

_$NomineeImpl _$$NomineeImplFromJson(Map<String, dynamic> json) =>
    _$NomineeImpl(
      id: (json['id'] as num).toInt(),
      mobile: json['mobile'] as String?,
      relation: json['relation'] as String,
      name: json['name'] as String,
      share: (json['share'] as num).toDouble(),
      equalShareCheckbox: json['equalShareCheckbox'] as bool? ?? false,
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

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      fieldName: json['fieldName'] as String,
      fieldValue: json['fieldValue'] as String?,
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldValue': instance.fieldValue,
    };
