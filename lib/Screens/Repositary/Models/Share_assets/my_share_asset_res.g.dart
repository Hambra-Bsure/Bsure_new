// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_share_asset_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyShareAssetsResponseImpl _$$MyShareAssetsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyShareAssetsResponseImpl(
      success: json['success'] as bool,
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
      details: (json['details'] as List<dynamic>)
          .map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'category': instance.category,
      'nominees': instance.nominees,
      'details': instance.details,
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
    };

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      fieldName: json['fieldName'] as String,
      fieldValue: json['fieldValue'] as String,
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldValue': instance.fieldValue,
    };
