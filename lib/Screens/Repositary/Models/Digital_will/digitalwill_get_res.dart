import 'package:freezed_annotation/freezed_annotation.dart';
part 'digitalwill_get_res.freezed.dart';
part 'digitalwill_get_res.g.dart';

@freezed
class DigitalwillgetResponse with _$DigitalwillgetResponse {
  factory DigitalwillgetResponse({
    bool? success,
    String? message,
    required List<Asset> assets,
  }) = _DigitalwillgetResponse;

  factory DigitalwillgetResponse.fromJson(Map<String, dynamic> json) =>
      _$DigitalwillgetResponseFromJson(json);
}

@freezed
class Asset with _$Asset {
  factory Asset({
    int? assetId,
    String? category,
    required List<Nominee> nominees,
    required List<Detail> details,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Nominee with _$Nominee {
  factory Nominee({
    required int id,
    required String? mobile,
    required String relation,
    required String name,
    required double share,
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

  factory Detail.fromJson(Map<String, dynamic> json) =>
      Detail(
        fieldName: json['fieldName'] as String,
        fieldValue: json['fieldValue']?.toString(), // Convert to String
      );
}
