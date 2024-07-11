// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BondResponseImpl _$$BondResponseImplFromJson(Map<String, dynamic> json) =>
    _$BondResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Bond.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BondResponseImplToJson(_$BondResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$BondImpl _$$BondImplFromJson(Map<String, dynamic> json) => _$BondImpl(
      category: json['category'] as String?,
      bondName: json['bondName'] as String?,
      bondNumber: json['bondNumber'] as String?,
      maturityDate: json['maturityDate'] as String?,
      authorityWhoIssuedTheBond: json['authorityWhoIssuedTheBond'] as String?,
      typeOfBond: json['typeOfBond'] as String?,
      comments: json['comments'] as String?,
      attachment: json['attachment'] as String?,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$BondImplToJson(_$BondImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'bondName': instance.bondName,
      'bondNumber': instance.bondNumber,
      'maturityDate': instance.maturityDate,
      'authorityWhoIssuedTheBond': instance.authorityWhoIssuedTheBond,
      'typeOfBond': instance.typeOfBond,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
