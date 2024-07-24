import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_asset_response.freezed.dart';
part 'post_asset_response.g.dart';

@freezed
class PostAssetResponse with _$PostAssetResponse {
  const factory PostAssetResponse({
    required bool success,
    required String message,
    required Asset asset,
  }) = _PostAssetResponse;

  factory PostAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$PostAssetResponseFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    required int assetId,
    required int userId,
    required String category,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
