import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'mutual_fund.freezed.dart';
part 'mutual_fund.g.dart';

@freezed
class MutualFundResponse with _$MutualFundResponse {
  factory MutualFundResponse({
    required bool success,
    required String message,
    required List<MutualFund> assets,
  }) = _MutualFundResponse;

  factory MutualFundResponse.fromJson(Map<String, Object?> json) =>
      _$MutualFundResponseFromJson(json);
}

@freezed
class MutualFund with _$MutualFund {
  factory MutualFund({
    required String? category,
    required String? amcName,
    required String? schemeName,
    required String? folioNumber,
    required String? fundType,
    required String? attachment,
    required String? comments,
    required int? assetId,
  }) = _MutualFund;

  factory MutualFund.fromJson(Map<String, dynamic> json) =>
      _$MutualFundFromJson(json);
}
