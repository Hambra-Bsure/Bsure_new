import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'Nps.freezed.dart';
part 'Nps.g.dart'; // This line is necessary for code generation

@freezed
class NPSResponse with _$NPSResponse {
  factory NPSResponse({
    required bool success,
    required String message,
    required List<NPS> assets,
  }) = _NPSResponse;

  factory NPSResponse.fromJson(Map<String, dynamic> json) =>
      _$NPSResponseFromJson(json);
}

@freezed
class NPS with _$NPS {
  factory NPS({
    required String category,
    required String pranNumber,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _NPS;

  factory NPS.fromJson(Map<String, dynamic> json) =>
      _$NPSFromJson(json);
}

