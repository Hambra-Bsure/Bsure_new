import 'package:freezed_annotation/freezed_annotation.dart';

part 'will_state.freezed.dart';
part 'will_state.g.dart';

@freezed
class WillState with _$WillState {
  const factory WillState({
    @Default(<Asset>[]) List<Asset> assets,
    @Default(false) bool sameDistributionCheckbox,
  }) = _WillState;

  factory WillState.fromJson(Map<String, dynamic> json) =>
      _$WillStateFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    required int assetId,
    required String category,
    @Default(false) bool equalDistributionCheckbox,
    @Default(<Nominee>[]) List<Nominee> nominees,
    @Default(<Detail>[]) List<Detail> details,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Nominee with _$Nominee {
  const factory Nominee({
    required int id,
    required String? mobile,
    required String relation,
    required String name,
    required double share,
    @Default(false) bool equalShareCheckbox,
  }) = _Nominee;

  factory Nominee.fromJson(Map<String, dynamic> json) =>
      _$NomineeFromJson(json);
}

@freezed
class Detail with _$Detail {
  const factory Detail({
    required String fieldName,
    required String? fieldValue,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    fieldName: json['fieldName'] as String,
    fieldValue: json['fieldValue']?.toString(), // Convert to String
  );
}

