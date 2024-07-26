// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ppf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PPfResponseImpl _$$PPfResponseImplFromJson(Map<String, dynamic> json) =>
    _$PPfResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PPf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PPfResponseImplToJson(_$PPfResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$PPfImpl _$$PPfImplFromJson(Map<String, dynamic> json) => _$PPfImpl(
      category: json['category'] as String,
      ppfAccountNumber: json['ppfAccountNumber'] as String,
      institutionName: json['institutionName'] as String,
      comments: json['comments'] as String?,
      attachment: json['attachment'] as String?,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$PPfImplToJson(_$PPfImpl instance) => <String, dynamic>{
      'category': instance.category,
      'ppfAccountNumber': instance.ppfAccountNumber,
      'institutionName': instance.institutionName,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
