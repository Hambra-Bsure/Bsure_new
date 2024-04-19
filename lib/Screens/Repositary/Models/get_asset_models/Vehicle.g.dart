// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleResponseImpl _$$VehicleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VehicleResponseImplToJson(
        _$VehicleResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      category: json['category'] as String,
      vehicleType: json['vehicleType'] as String,
      brandName: json['brandName'] as String,
      modelName: json['modelName'] as String,
      registrationNumber: json['registrationNumber'] as String,
      chassisNumber: json['chassisNumber'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'vehicleType': instance.vehicleType,
      'brandName': instance.brandName,
      'modelName': instance.modelName,
      'registrationNumber': instance.registrationNumber,
      'chassisNumber': instance.chassisNumber,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
