
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_share_asset_res.freezed.dart';
part 'my_share_asset_res.g.dart';


@freezed
abstract class MyShareAssetsResponse with _$MyShareAssetsResponse {
  factory MyShareAssetsResponse({
    required bool success,
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
    required List<Detail> details,
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
    required int sharedAssetId,
  }) = _Nominee;

  factory Nominee.fromJson(Map<String, dynamic> json) =>
      _$NomineeFromJson(json);
}

@freezed
abstract class Detail with _$Detail {
  factory Detail({
    required String fieldName,
    required String? fieldValue,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
