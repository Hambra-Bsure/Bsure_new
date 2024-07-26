import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'pf.freezed.dart';
part 'pf.g.dart'; // This line is necessary for code generation

@freezed
class PfResponse with _$PfResponse {
  factory PfResponse({
    required bool success,
    required String message,
    required List<PF> assets,
  }) = _PfResponse;

  factory PfResponse.fromJson(Map<String, dynamic> json) =>
      _$PfResponseFromJson(json);
}

@freezed
class PF with _$PF {
  factory PF({
    required String category,
    required String uanNumber,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _PF;

  factory PF.fromJson(Map<String, dynamic> json) =>
      _$PFFromJson(json);
}

