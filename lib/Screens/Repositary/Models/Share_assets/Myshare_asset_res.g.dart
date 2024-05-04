// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Myshare_asset_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyShareAssetsResponseImpl _$$MyShareAssetsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyShareAssetsResponseImpl(
      success: json['success'] as bool?,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyShareAssetsResponseImplToJson(
        _$MyShareAssetsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'assets': instance.assets,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      id: json['id'] as int,
      userId: json['userId'] as int,
      category: json['category'] as String,
      nominees: (json['nominees'] as List<dynamic>)
          .map((e) => Nominee.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankAccount: json['bankAccount'] == null
          ? null
          : BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
      mutualFund: json['mutualFund'] == null
          ? null
          : MutualFund.fromJson(json['mutualFund'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'category': instance.category,
      'nominees': instance.nominees,
      'bankAccount': instance.bankAccount,
      'mutualFund': instance.mutualFund,
    };

_$NomineeImpl _$$NomineeImplFromJson(Map<String, dynamic> json) =>
    _$NomineeImpl(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String,
      relation: json['relation'] as String,
      age: json['age'] as int,
      image: json['image'] as String?,
      idProof: json['idProof'] as String?,
      guardianName: json['guardianName'] as String?,
      guardianMobileNumber: json['guardianMobileNumber'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$$NomineeImplToJson(_$NomineeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'address': instance.address,
      'relation': instance.relation,
      'age': instance.age,
      'image': instance.image,
      'idProof': instance.idProof,
      'guardianName': instance.guardianName,
      'guardianMobileNumber': instance.guardianMobileNumber,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
    };

_$BankAccountImpl _$$BankAccountImplFromJson(Map<String, dynamic> json) =>
    _$BankAccountImpl(
      category: json['category'] as String,
      bankName: json['bankName'] as String,
      assetId: json['assetId'] as int,
      attachment: json['attachment'] as String,
      comments: json['comments'] as String,
      accountType: json['accountType'] as String,
      branchName: json['branchName'] as String,
      ifscCode: json['ifscCode'] as String?,
      accountNumber: json['accountNumber'] as String?,
    );

Map<String, dynamic> _$$BankAccountImplToJson(_$BankAccountImpl instance) =>
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

_$MutualFundImpl _$$MutualFundImplFromJson(Map<String, dynamic> json) =>
    _$MutualFundImpl(
      id: json['id'] as int,
      amcName: json['amcName'] as String,
      schemeName: json['schemeName'] as String,
      folioNumber: json['folioNumber'] as String,
      fundType: json['fundType'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$MutualFundImplToJson(_$MutualFundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amcName': instance.amcName,
      'schemeName': instance.schemeName,
      'folioNumber': instance.folioNumber,
      'fundType': instance.fundType,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
