// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_Insurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LifeInsuranceResponseImpl _$$LifeInsuranceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LifeInsuranceResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => LifeInsurance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LifeInsuranceResponseImplToJson(
        _$LifeInsuranceResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$LifeInsuranceImpl _$$LifeInsuranceImplFromJson(Map<String, dynamic> json) =>
    _$LifeInsuranceImpl(
      category: json['category'] as String,
      insuranceCompanyName: json['insuranceCompanyName'] as String,
      policyName: json['policyName'] as String,
      policyNumber: json['policyNumber'] as String,
      coverageAmount: (json['coverageAmount'] as num?)?.toInt(),
      maturityDate: json['maturityDate'] as String?,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$LifeInsuranceImplToJson(_$LifeInsuranceImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'insuranceCompanyName': instance.insuranceCompanyName,
      'policyName': instance.policyName,
      'policyNumber': instance.policyNumber,
      'coverageAmount': instance.coverageAmount,
      'maturityDate': instance.maturityDate,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
