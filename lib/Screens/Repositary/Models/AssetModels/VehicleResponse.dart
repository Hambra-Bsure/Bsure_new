class VehicleResponse {
  Asset? asset;
  bool? success;
  String? message;

  VehicleResponse({this.asset, this.success, this.message});

  VehicleResponse.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.asset != null) {
      data['asset'] = this.asset!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
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
    json['Vehicle'] != null ? new Vehicle.fromJson(json['Vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.vehicle != null) {
      data['Vehicle'] = this.vehicle!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicleType'] = this.vehicleType;
    data['brandName'] = this.brandName;
    data['modelName'] = this.modelName;
    data['registrationNumber'] = this.registrationNumber;
    data['chassisNumber'] = this.chassisNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
