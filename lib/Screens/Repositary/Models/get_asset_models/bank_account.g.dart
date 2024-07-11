// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankResponseImpl _$$BankResponseImplFromJson(Map<String, dynamic> json) =>
    _$BankResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BankResponseImplToJson(_$BankResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      category: json['category'] as String,
      bankName: json['bankName'] as String,
      assetId: (json['assetId'] as num).toInt(),
      attachment: json['attachment'] as String,
      comments: json['comments'] as String,
      accountType: json['accountType'] as String,
      branchName: json['branchName'] as String,
      ifscCode: json['ifscCode'] as String?,
      accountNumber: json['accountNumber'] as String?,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'bankName': instance.bankName,
      'assetId': instance.assetId,
      'attachment': instance.attachment,
      'comments': instance.comments,
      'accountType': instance.accountType,
      'branchName': instance.branchName,
      'ifscCode': instance.ifscCode,
      'accountNumber': instance.accountNumber,
    };
