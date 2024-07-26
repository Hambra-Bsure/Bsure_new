import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'gold.freezed.dart';
part 'gold.g.dart'; // This line is necessary for code generation

@freezed
class GoldResponse with _$GoldResponse {
  factory GoldResponse({
    required bool success,
    required String message,
    required List<Golds> assets,
  }) = _GoldResponse;

  factory GoldResponse.fromJson(Map<String, dynamic> json) =>
      _$GoldResponseFromJson(json);
}

@freezed
class Golds with _$Golds {
  factory Golds({
    required String category,
    required String metalType,
    required String type,
    required int weightInGrams,
    required String? whereItIsKept, // Change type to String
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _Golds;

  factory Golds.fromJson(Map<String, dynamic> json) => _$GoldsFromJson(json);
}


