import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'Vehicle.freezed.dart';
part 'Vehicle.g.dart'; // This line is necessary for code generation

@freezed
class VehicleResponse with _$VehicleResponse {
  factory VehicleResponse({
    required bool success,
    required String message,
    required List<Vehicle> assets,
  }) = _VehicleResponse;

  factory VehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleResponseFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  factory Vehicle({
    required String category,
    required String vehicleType,
    required String brandName,
    required String modelName,
    required String registrationNumber,
    required String chassisNumber,
    required String comments,

    required String attachment,
    required int assetId,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

