// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutual_fund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MutualFundResponseImpl _$$MutualFundResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MutualFundResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => MutualFund.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MutualFundResponseImplToJson(
        _$MutualFundResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$MutualFundImpl _$$MutualFundImplFromJson(Map<String, dynamic> json) =>
    _$MutualFundImpl(
      category: json['category'] as String,
      amcName: json['amcName'] as String?,
      schemeName: json['schemeName'] as String?,
      folioNumber: json['folioNumber'] as String?,
      fundType: json['fundType'] as String?,
      attachment: json['attachment'] as String?,
      comments: json['comments'] as String?,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$MutualFundImplToJson(_$MutualFundImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amcName': instance.amcName,
      'schemeName': instance.schemeName,
      'folioNumber': instance.folioNumber,
      'fundType': instance.fundType,
      'attachment': instance.attachment,
      'comments': instance.comments,
      'assetId': instance.assetId,
    };
