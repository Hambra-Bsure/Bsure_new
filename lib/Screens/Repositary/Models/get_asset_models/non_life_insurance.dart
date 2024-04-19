import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'non_life_insurance.freezed.dart';
part 'non_life_insurance.g.dart'; // This line is necessary for code generation

@freezed
class NonLifeInsuranceResponse with _$NonLifeInsuranceResponse {
  factory NonLifeInsuranceResponse({
    required bool success,
    required String message,
    required List<NonLifeInsurance> assets,
  }) = _NonLifeInsuranceResponse;

  factory NonLifeInsuranceResponse.fromJson(Map<String, dynamic> json) =>
      _$NonLifeInsuranceResponseFromJson(json);
}

@freezed
class NonLifeInsurance with _$NonLifeInsurance {
  factory NonLifeInsurance({
    required String category,
    required String insuranceCompanyName,
    required String typeOfInsurance,
    required String policyName,
    required String policyNumber,
    required String comments,
    required String attachment,
    required int assetId,
  }) = _NonLifeInsurance;

  factory NonLifeInsurance.fromJson(Map<String, dynamic> json) =>
      _$NonLifeInsuranceFromJson(json);
}

