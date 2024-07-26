import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'Ppf.freezed.dart';
part 'Ppf.g.dart'; // This line is necessary for code generation

@freezed
class PPfResponse with _$PPfResponse {
  factory PPfResponse({
    required bool success,
    required String message,
    required List<PPf> assets,
  }) = _PPfResponse;

  factory PPfResponse.fromJson(Map<String, dynamic> json) =>
      _$PPfResponseFromJson(json);
}

@freezed
class PPf with _$PPf {
  factory PPf({
    required String category,
    required String ppfAccountNumber,
    required String institutionName,
    required String? comments, // Making comments field nullable if it's not always present
    required String? attachment, // Making attachment field nullable if it's not always present
    required int assetId,
  }) = _PPf;

  factory PPf.fromJson(Map<String, dynamic> json) =>
      _$PPfFromJson(json);
}

