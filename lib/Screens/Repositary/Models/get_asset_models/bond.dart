import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'bond.freezed.dart';
part 'bond.g.dart'; // This line is necessary for code generation

@freezed
class BondResponse with _$BondResponse {
  factory BondResponse({
    required bool success,
    required String message,
    required List<Bond> assets,
  }) = _BondResponse;

  factory BondResponse.fromJson(Map<String, dynamic> json) =>
      _$BondResponseFromJson(json);
}

@freezed
class Bond with _$Bond {
  factory Bond({
    required String? category,
    required String? bondName,
    required String? bondNumber,
    required String? maturityDate,
    required String? authorityWhoIssuedTheBond,
    required String? typeOfBond,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _Bond;

  factory Bond.fromJson(Map<String, dynamic> json) => _$BondFromJson(json);
}


