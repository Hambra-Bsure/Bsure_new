// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Get_user_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserResponseImpl _$$GetUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserResponseImpl(
      success: json['success'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserResponseImplToJson(
        _$GetUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      whatsappNumber: json['whatsappNumber'] as String?,
      secondaryNumber: json['secondaryNumber'] as String?,
      address: json['address'] as String?,
      panNumber: json['panNumber'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'whatsappNumber': instance.whatsappNumber,
      'secondaryNumber': instance.secondaryNumber,
      'address': instance.address,
      'panNumber': instance.panNumber,
      'age': instance.age,
      'gender': instance.gender,
      'photo': instance.photo,
    };
