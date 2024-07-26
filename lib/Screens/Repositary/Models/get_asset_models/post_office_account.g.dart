// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_office_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostOfficeAccountResponseImpl _$$PostOfficeAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostOfficeAccountResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PostOfficeAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PostOfficeAccountResponseImplToJson(
        _$PostOfficeAccountResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$PostOfficeAccountImpl _$$PostOfficeAccountImplFromJson(
        Map<String, dynamic> json) =>
    _$PostOfficeAccountImpl(
      category: json['category'] as String,
      branchName: json['branchName'] as String,
      accountNumber: json['accountNumber'] as String?,
      accountType: json['accountType'] as String,
      comments: json['comments'] as String?,
      attachment: json['attachment'] as String?,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$PostOfficeAccountImplToJson(
        _$PostOfficeAccountImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'branchName': instance.branchName,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
