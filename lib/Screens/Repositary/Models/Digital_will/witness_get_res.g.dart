// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'witness_get_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WitnessgetResponseImpl _$$WitnessgetResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WitnessgetResponseImpl(
      success: json['success'] as bool,
      witnesses: (json['witnesses'] as List<dynamic>)
          .map((e) => Witness.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WitnessgetResponseImplToJson(
        _$WitnessgetResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'witnesses': instance.witnesses,
    };

_$WitnessImpl _$$WitnessImplFromJson(Map<String, dynamic> json) =>
    _$WitnessImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobile: json['mobile'] as String,
      address: json['address'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$$WitnessImplToJson(_$WitnessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobile': instance.mobile,
      'address': instance.address,
      'verified': instance.verified,
    };
