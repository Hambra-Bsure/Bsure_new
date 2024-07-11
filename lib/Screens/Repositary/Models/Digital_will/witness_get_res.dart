import 'package:freezed_annotation/freezed_annotation.dart';
part 'witness_get_res.freezed.dart';
part 'witness_get_res.g.dart';

@freezed
class WitnessgetResponse with _$WitnessgetResponse {
  factory WitnessgetResponse({
    required bool success,
    required List<Witness> witnesses,
  }) = _WitnessgetResponse;

  factory WitnessgetResponse.fromJson(Map<String, dynamic> json) =>
      _$WitnessgetResponseFromJson(json);
}

@freezed
class Witness with _$Witness {
  factory Witness({
    required int id,
    required String firstName,
    required String lastName,
    required String mobile,
    required String address,
    required bool verified,
  }) = _Witness;

  factory Witness.fromJson(Map<String, dynamic> json) =>
      _$WitnessFromJson(json);
}
