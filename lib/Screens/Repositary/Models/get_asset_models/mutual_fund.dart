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
    required String category,
    String? amcName,
    String? schemeName,
    String? folioNumber,
    String? fundType,
    String? attachment,
    String? comments,
    required int assetId,
  }) = _MutualFund;

  factory MutualFund.fromJson(Map<String, dynamic> json) =>
      _$MutualFundFromJson(json);
}


/* 

{
    "success": true,
    "message": "Assets fetched successfully",
    "assets": [
        {
            "category": "MutualFund",
            "amcName": "",
            "schemeName": "",
            "folioNumber": "",
            "fundType": "",
            "comments": "",
            "attachment": "",
            "assetId": 65
        },
        {
            "category": "MutualFund",
            "amcName": "1",
            "schemeName": "2",
            "folioNumber": "3",
            "fundType": "4",
            "comments": "5",
            "attachment": "5",
            "assetId": 66
        }
    ]
}

 */