// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_life_insurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NonLifeInsuranceResponseImpl _$$NonLifeInsuranceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NonLifeInsuranceResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => NonLifeInsurance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NonLifeInsuranceResponseImplToJson(
        _$NonLifeInsuranceResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$NonLifeInsuranceImpl _$$NonLifeInsuranceImplFromJson(
        Map<String, dynamic> json) =>
    _$NonLifeInsuranceImpl(
      category: json['category'] as String,
      insuranceCompanyName: json['insuranceCompanyName'] as String,
      typeOfInsurance: json['typeOfInsurance'] as String,
      policyName: json['policyName'] as String,
      policyNumber: json['policyNumber'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$NonLifeInsuranceImplToJson(
        _$NonLifeInsuranceImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'insuranceCompanyName': instance.insuranceCompanyName,
      'typeOfInsurance': instance.typeOfInsurance,
      'policyName': instance.policyName,
      'policyNumber': instance.policyNumber,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
