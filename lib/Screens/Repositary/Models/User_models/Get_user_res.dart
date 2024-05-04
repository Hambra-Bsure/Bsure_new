import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Get_user_res.freezed.dart';
part 'Get_user_res.g.dart';

@freezed
class GetUserResponse with _$GetUserResponse {
  factory GetUserResponse({
    @Default(false) bool? success,
    User? user,
  }) = _GetUserResponse;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? whatsappNumber,
    String? secondaryNumber,
    String? address,
    String? panNumber,
    int? age,
    String? gender,
    String? photo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
