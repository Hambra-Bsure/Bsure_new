import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'esop.freezed.dart';
part 'esop.g.dart'; // This line is necessary for code generation

@freezed
class EsopResponse with _$EsopResponse {
  factory EsopResponse({
    required bool success,
    required String message,
    required List<Esop> assets,
  }) = _EsopResponse;

  factory EsopResponse.fromJson(Map<String, dynamic> json) =>
      _$EsopResponseFromJson(json);
}

@freezed
class Esop with _$Esop {
  factory Esop({
    required String category,
    required String companyName,
    required int? numberOfStocks, // Change type to int
    required int? optionPrice,
    required String expiryDate,
    required int? totalSharesAvailableForIssue, // Change type to int
    required int? issuePricePerShare,
    required String comments,
    required String attachment,
    required int assetId,
  }) = _Esop;

  factory Esop.fromJson(Map<String, dynamic> json) => _$EsopFromJson(json);
}




