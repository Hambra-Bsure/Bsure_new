// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealEstateResponseImpl _$$RealEstateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RealEstateResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => RealEstate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RealEstateResponseImplToJson(
        _$RealEstateResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$RealEstateImpl _$$RealEstateImplFromJson(Map<String, dynamic> json) =>
    _$RealEstateImpl(
      category: json['category'] as String,
      typeOfProperty: json['typeOfProperty'] as String?,
      address: json['address'] as String?,
      khataNumber: json['khataNumber'] as String?,
      northOfProperty: json['northOfProperty'] as String?,
      southOfProperty: json['southOfProperty'] as String?,
      eastOfProperty: json['eastOfProperty'] as String?,
      westOfProperty: json['westOfProperty'] as String?,
      image: json['image'] as String?,
      comments: json['comments'] as String?,
      attachment: json['attachment'] as String?,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$RealEstateImplToJson(_$RealEstateImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'typeOfProperty': instance.typeOfProperty,
      'address': instance.address,
      'khataNumber': instance.khataNumber,
      'northOfProperty': instance.northOfProperty,
      'southOfProperty': instance.southOfProperty,
      'eastOfProperty': instance.eastOfProperty,
      'westOfProperty': instance.westOfProperty,
      'image': instance.image,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
