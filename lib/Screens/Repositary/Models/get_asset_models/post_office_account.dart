import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'post_office_account.freezed.dart';
part 'post_office_account.g.dart'; // This line is necessary for code generation

@freezed
class PostOfficeAccountResponse with _$PostOfficeAccountResponse {
  factory PostOfficeAccountResponse({
    required bool success,
    required String message,
    required List<PostOfficeAccount> assets,
  }) = _PostOfficeAccountResponse;

  factory PostOfficeAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$PostOfficeAccountResponseFromJson(json);
}

@freezed
class PostOfficeAccount with _$PostOfficeAccount {
  factory PostOfficeAccount({
    required String category,
    required String branchName,
    required String? accountNumber,
    required String accountType,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _PostOfficeAccount;

  factory PostOfficeAccount.fromJson(Map<String, dynamic> json) =>
      _$PostOfficeAccountFromJson(json);
}

