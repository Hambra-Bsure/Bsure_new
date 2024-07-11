// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Get_Nominee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetNomineeResponseImpl _$$GetNomineeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNomineeResponseImpl(
      success: json['success'] as bool?,
      nominees: (json['nominees'] as List<dynamic>?)
          ?.map((e) => Nominees.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetNomineeResponseImplToJson(
        _$GetNomineeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'nominees': instance.nominees,
    };

_$NomineesImpl _$$NomineesImplFromJson(Map<String, dynamic> json) =>
    _$NomineesImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      relation: json['relation'] as String?,
      age: (json['age'] as num?)?.toInt(),
      image: json['image'] as String?,
      idProof: json['idProof'] as String?,
      guardianName: json['guardianName'] as String?,
      guardianMobileNumber: json['guardianMobileNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NomineesImplToJson(_$NomineesImpl instance) =>
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
