// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digitalwill_get_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitalwillgetResponseImpl _$$DigitalwillgetResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DigitalwillgetResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      witness: (json['witness'] as List<dynamic>)
          .map((e) => Witness.fromJson(e as Map<String, dynamic>))
          .toList(),
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DigitalwillgetResponseImplToJson(
        _$DigitalwillgetResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'witness': instance.witness,
      'assets': instance.assets,
    };

_$WitnessImpl _$$WitnessImplFromJson(Map<String, dynamic> json) =>
    _$WitnessImpl(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$WitnessImplToJson(_$WitnessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobile': instance.mobile,
      'address': instance.address,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      assetId: json['assetId'] as int?,
      category: json['category'] as String?,
      nominees: (json['nominees'] as List<dynamic>)
          .map((e) => Nominee.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: (json['details'] as List<dynamic>)
          .map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'category': instance.category,
      'nominees': instance.nominees,
      'details': instance.details,
    };

_$NomineeImpl _$$NomineeImplFromJson(Map<String, dynamic> json) =>
    _$NomineeImpl(
      id: json['id'] as int,
      mobile: json['mobile'] as String?,
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

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      fieldName: json['fieldName'] as String,
      fieldValue: json['fieldValue'] as String?,
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldValue': instance.fieldValue,
    };
