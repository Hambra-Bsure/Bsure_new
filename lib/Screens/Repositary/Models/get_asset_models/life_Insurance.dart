import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'life_Insurance.freezed.dart';
part 'life_Insurance.g.dart'; // This line is necessary for code generation

@freezed
class LifeInsuranceResponse with _$LifeInsuranceResponse {
  factory LifeInsuranceResponse({
    required bool success,
    required String message,
    required List<LifeInsurance> assets,
  }) = _LifeInsuranceResponse;

  factory LifeInsuranceResponse.fromJson(Map<String, dynamic> json) =>
      _$LifeInsuranceResponseFromJson(json);
}

@freezed
class LifeInsurance with _$LifeInsurance {
  factory LifeInsurance({
    required String category,
    required String insuranceCompanyName,
    required String policyName,
    required String policyNumber,
    required int coverageAmount, // Assuming coverageAmount is an integer
    required String maturityDate,
    required String comments,
    required String attachment,
    required int assetId,
  }) = _LifeInsurance;

  factory LifeInsurance.fromJson(Map<String, dynamic> json) =>
      _$LifeInsuranceFromJson(json);
}


