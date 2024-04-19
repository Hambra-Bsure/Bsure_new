import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'real_estate.freezed.dart';
part 'real_estate.g.dart'; // This line is necessary for code generation

@freezed
class RealEstateResponse with _$RealEstateResponse {
  factory RealEstateResponse({
    required bool success,
    required String message,
    required List<RealEstate> assets,
  }) = _RealEstateResponse;

  factory RealEstateResponse.fromJson(Map<String, dynamic> json) =>
      _$RealEstateResponseFromJson(json);
}

@freezed
class RealEstate with _$RealEstate {
  factory RealEstate({
    required String category,
    required String? typeOfProperty,
    required String? address,
    required String? khataNumber,
    required String? northOfProperty,
    required String? southOfProperty,
    required String? eastOfProperty,
    required String? westOfProperty, // Corrected typo
    required String? image,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _RealEstate;

  factory RealEstate.fromJson(Map<String, dynamic> json) =>
      _$RealEstateFromJson(json);
}


