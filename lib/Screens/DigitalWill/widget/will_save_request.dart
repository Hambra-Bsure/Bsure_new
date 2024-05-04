import 'package:freezed_annotation/freezed_annotation.dart';

part 'will_save_request.freezed.dart';
part 'will_save_request.g.dart';

@freezed
class WillSaveReq with _$WillSaveReq {
  factory WillSaveReq({
    required List<AssetReq> assets,
  }) =
      _WillSaveReq;
  factory WillSaveReq.fromJson(Map<String, Object?> json) =>
      _$WillSaveReqFromJson(json);
}

@freezed
class AssetReq with _$AssetReq {
  factory AssetReq({
    required int assetId,
    required List<NomineeReq> nominees,
  }) =
      _AssetReq;

  factory AssetReq.fromJson(Map<String, Object?> json) =>
      _$AssetReqFromJson(json);
}

@freezed
class NomineeReq with _$NomineeReq {
  factory NomineeReq({
    required int nomineeId,
    required double share,
  }) =
      _NomineeReq;

  factory NomineeReq.fromJson(Map<String, Object?> json) =>
      _$NomineeReqFromJson(json);
}
