import 'package:freezed_annotation/freezed_annotation.dart';
part 'Myshare_asset_res.freezed.dart';
part 'Myshare_asset_res.g.dart';

@freezed
abstract class MyShareAssetsResponse with _$MyShareAssetsResponse {
  factory MyShareAssetsResponse({
    required bool? success,
    required List<Asset> assets,
  }) = _MyShareAssetsResponse;

  factory MyShareAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyShareAssetsResponseFromJson(json);
}

@freezed
abstract class Asset with _$Asset {
  factory Asset({
    required int id,
    required int userId,
    required String category,
    required List<Nominee> nominees,
    BankAccount? bankAccount,
    MutualFund? mutualFund,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}


@freezed
abstract class Nominee with _$Nominee {
  factory Nominee({
    required int id,
    required String firstName,
    required String lastName,
    required String? mobileNumber,
    required String? email,
    required String address,
    required String relation,
    required int age,
    required String? image,
    required String? idProof,
    required String? guardianName,
    required String? guardianMobileNumber,
    required String createdAt,
    required String updatedAt,
    required int userId,
  }) = _Nominee;

  factory Nominee.fromJson(Map<String, dynamic> json) =>
      _$NomineeFromJson(json);
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
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, Object?> json) =>
      _$BankAccountFromJson(json);
}

@freezed
abstract class MutualFund with _$MutualFund {
  factory MutualFund({
    required int id,
    required String amcName,
    required String schemeName,
    required String folioNumber,
    required String fundType,
    required String comments,
    required String attachment,
    required int assetId,
  }) = _MutualFund;

  factory MutualFund.fromJson(Map<String, dynamic> json) =>
      _$MutualFundFromJson(json);
}
