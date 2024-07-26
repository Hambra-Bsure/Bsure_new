// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EsopResponseImpl _$$EsopResponseImplFromJson(Map<String, dynamic> json) =>
    _$EsopResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Esop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EsopResponseImplToJson(_$EsopResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$EsopImpl _$$EsopImplFromJson(Map<String, dynamic> json) => _$EsopImpl(
      category: json['category'] as String,
      companyName: json['companyName'] as String,
      numberOfStocks: (json['numberOfStocks'] as num).toInt(),
      optionPrice: (json['optionPrice'] as num?)?.toInt(),
      expiryDate: json['expiryDate'] as String?,
      totalSharesAvailableForIssue:
          (json['totalSharesAvailableForIssue'] as num?)?.toInt(),
      issuePricePerShare: (json['issuePricePerShare'] as num?)?.toInt(),
      comments: json['comments'] as String?,
      attachment: json['attachment'] as String?,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$EsopImplToJson(_$EsopImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'companyName': instance.companyName,
      'numberOfStocks': instance.numberOfStocks,
      'optionPrice': instance.optionPrice,
      'expiryDate': instance.expiryDate,
      'totalSharesAvailableForIssue': instance.totalSharesAvailableForIssue,
      'issuePricePerShare': instance.issuePricePerShare,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
