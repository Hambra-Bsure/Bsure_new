import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'others.freezed.dart';
part 'others.g.dart'; // This line is necessary for code generation

@freezed
class OtherResponse with _$OtherResponse {
  factory OtherResponse({
    required bool success,
    required String message,
    required List<Other> assets,
  }) = _OtherResponse;

  factory OtherResponse.fromJson(Map<String, dynamic> json) =>
      _$OtherResponseFromJson(json);
}

@freezed
class Other with _$Other {
  factory Other({
    required String category,
    required String assetName,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) =>
      _$OtherFromJson(json);
}
