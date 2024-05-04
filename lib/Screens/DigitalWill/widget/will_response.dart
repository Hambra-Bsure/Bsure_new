import 'package:freezed_annotation/freezed_annotation.dart';
part 'will_response.freezed.dart';
part 'will_response.g.dart';

@freezed
class WillResponse with _$WillResponse {
  const factory WillResponse({
    required List<Asset> assets,
  }) = _WillResponse;

  factory WillResponse.fromJson(Map<String, dynamic> json) =>
      _$WillResponseFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    required int assetId,
    required String assetName,
    required String? assetIdentity,
    required int categoryId,
    @Default(false) bool equalShareCheckbox,
    required List<Nominee> nominees,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Nominee with _$Nominee {
  const factory Nominee({
    required int id,
    required String mobile,
    required String relation,
    required String name,
    required double share,
  }) = _Nominee;

  factory Nominee.fromJson(Map<String, dynamic> json) =>
      _$NomineeFromJson(json);
}
