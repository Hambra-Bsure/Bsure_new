import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Get_Nominee_response.freezed.dart';
part 'Get_Nominee_response.g.dart';

@freezed
class GetNomineeResponse with _$GetNomineeResponse {
  factory GetNomineeResponse({
    bool? success,
    List<Nominees>? nominees,
  }) = _GetNomineeResponse;

  factory GetNomineeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNomineeResponseFromJson(json);
}

@freezed
class Nominees with _$Nominees {
  factory Nominees({
    int? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? email,
    String? address,
    String? relation,
    int? age,
    String? image,
    String? idProof,
    String? guardianName,
    String? guardianMobileNumber,
    String? createdAt,
    String? updatedAt,
    int? userId,
  }) = _Nominees;

  factory Nominees.fromJson(Map<String, dynamic> json) =>
      _$NomineesFromJson(json);
}
