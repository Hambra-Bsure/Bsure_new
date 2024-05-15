import 'package:freezed_annotation/freezed_annotation.dart';
part 'share_asset_withme_res.freezed.dart';
part 'share_asset_withme_res.g.dart';

@freezed
class ShareAssetswithmeResponse with _$ShareAssetswithmeResponse {
  factory ShareAssetswithmeResponse({
    required bool success,
    required String message,
    required List<UserData> data,
  }) = _ShareAssetswithmeResponse;

  factory ShareAssetswithmeResponse.fromJson(Map<String, dynamic> json) =>
      _$ShareAssetswithmeResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  factory UserData({
    required String firstName,
    required String lastName,
    required String email,
    required String mobileNumber,
    required List<Asset> assets,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
class Asset with _$Asset {
  factory Asset({
    required int id,
    required int userId,
    required String category,
    required List<Detail> details,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Detail with _$Detail {
  factory Detail({
    required String fieldName,
    required String fieldValue,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
