import 'package:freezed_annotation/freezed_annotation.dart';
part 'will_state.freezed.dart';
part 'will_state.g.dart';

@freezed
class WillState with _$WillState {
  const factory WillState({
    required List<Asset> assets,
    @Default(false) bool sameDistributionCheckbox,
  }) = _WillState;

  factory WillState.fromJson(Map<String, dynamic> json) =>
      _$WillStateFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    required int assetId,
    required String assetName,
    required String? assetIdentity,
    required int categoryId,
    @Default(false) bool equalDistributionCheckbox,
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
    @Default(false) equalShareCheckbox,
  }) = _Nominee;

  factory Nominee.fromJson(Map<String, dynamic> json) =>
      _$NomineeFromJson(json);
}
