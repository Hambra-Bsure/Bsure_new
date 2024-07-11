import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'bank_account.freezed.dart';

part 'bank_account.g.dart';

@freezed
class BankResponse with _$BankResponse {
  factory BankResponse({
    required bool success,
    required String message,
    required List<BankAccount> assets,
  }) = _BankResponse;

  factory BankResponse.fromJson(Map<String, Object?> json) =>
      _$BankResponseFromJson(json);
}

@freezed
class BankAccount with _$BankAccount {
  factory BankAccount({
    required String category,
    required String bankName,
    required int assetId,
    required String attachment,
    required String comments,
    required String accountType,
    required String branchName,
    required String? ifscCode,
    required String? accountNumber,
  }) = _Asset;

  factory BankAccount.fromJson(Map<String, Object?> json) =>
      _$BankAccountFromJson(json);
}
/*  {
            "category": "BankAccount",
            "bankName": "hdfc",
            "accountNumber": "1234",
            "ifscCode": "hdfc123",
            "branchName": "kadapa",
            "accountType": "Saving",
            "comments": "jhdgf",
            "attachment": "jgca",
            "assetId": 49
        },
 */
