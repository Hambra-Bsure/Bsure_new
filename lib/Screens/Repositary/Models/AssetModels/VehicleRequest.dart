class VehicleRequest {
  String? assetType;
  String? vehicleType;
  String? brandName;
  String? modelName;
  String? registrationNumber;
  String? chassisNumber;
  String? comments;
  String? attachment;

  VehicleRequest(
      {this.assetType,
        this.vehicleType,
        this.brandName,
        this.modelName,
        this.registrationNumber,
        this.chassisNumber,
        this.comments,
        this.attachment});

  VehicleRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    vehicleType = json['vehicleType'].cast<String>();
    brandName = json['brandName'];
    modelName = json['modelName'];
    registrationNumber = json['registrationNumber'];
    chassisNumber = json['chassisNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['vehicleType'] = vehicleType;
    data['brandName'] = brandName;
    data['modelName'] = modelName;
    data['registrationNumber'] = registrationNumber;
    data['chassisNumber'] = chassisNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}
