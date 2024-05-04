import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class GetAssetsResponse with _$GetAssetsResponse {
  const factory GetAssetsResponse({
    required List<Asset> assets,
    required bool success,
    required String message,
  }) = _GetAssetsResponse;

  factory GetAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssetsResponseFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    required String category,
    required List<AssetList> assetList,
    bool? isSelected,
    int? id
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class AssetList with _$AssetList {
  const factory AssetList({
    required String fieldName,
    required dynamic fieldValue,
  }) = _AssetList;

  factory AssetList.fromJson(Map<String, dynamic> json) =>
      _$AssetListFromJson(json);
}
