class VehicleResponse {
  Asset? asset;
  bool? success;
  String? message;

  VehicleResponse({this.asset, this.success, this.message});

  VehicleResponse.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (asset != null) {
      data['asset'] = asset!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Asset {
  int? id;
  int? userId;
  String? category;
  Vehicle? vehicle;

  Asset({this.id, this.userId, this.category, this.vehicle});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    vehicle =
    json['Vehicle'] != null ? Vehicle.fromJson(json['Vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (vehicle != null) {
      data['Vehicle'] = vehicle!.toJson();
    }
    return data;
  }
}

class Vehicle {
  int? id;
  String? vehicleType;
  String? brandName;
  String? modelName;
  String? registrationNumber;
  String? chassisNumber;
  String? comments;
  String? attachment;
  int? assetId;

  Vehicle(
      {this.id,
        this.vehicleType,
        this.brandName,
        this.modelName,
        this.registrationNumber,
        this.chassisNumber,
        this.comments,
        this.attachment,
        this.assetId});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleType = json['vehicleType'];
    brandName = json['brandName'];
    modelName = json['modelName'];
    registrationNumber = json['registrationNumber'];
    chassisNumber = json['chassisNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicleType'] = vehicleType;
    data['brandName'] = brandName;
    data['modelName'] = modelName;
    data['registrationNumber'] = registrationNumber;
    data['chassisNumber'] = chassisNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
