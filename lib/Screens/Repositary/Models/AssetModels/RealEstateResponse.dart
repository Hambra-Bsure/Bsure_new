class RealEstateResponse {
  Asset? asset;
  bool? success;
  String? message;

  RealEstateResponse({this.asset, this.success, this.message});

  RealEstateResponse.fromJson(Map<String, dynamic> json) {
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
  RealEstate? realEstate;

  Asset({this.id, this.userId, this.category, this.realEstate});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    realEstate = json['RealEstate'] != null
        ? RealEstate.fromJson(json['RealEstate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (realEstate != null) {
      data['RealEstate'] = realEstate!.toJson();
    }
    return data;
  }
}

class RealEstate {
  int? id;
  String? typeOfProperty;
  String? address;
  String? khataNumber;
  String? northOfProperty;
  String? southOfProperty;
  String? eastOfProperty;
  String? westOfProperty;
  String? image;
  String? comments;
  String? attachment;
  int? assetId;

  RealEstate(
      {this.id,
        this.typeOfProperty,
        this.address,
        this.khataNumber,
        this.northOfProperty,
        this.southOfProperty,
        this.eastOfProperty,
        this.westOfProperty,
        this.image,
        this.comments,
        this.attachment,
        this.assetId});

  RealEstate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeOfProperty = json['typeOfProperty'];
    address = json['address'];
    khataNumber = json['khataNumber'];
    northOfProperty = json['northOfProperty'];
    southOfProperty = json['southOfProperty'];
    eastOfProperty = json['eastOfProperty'];
    westOfProperty = json['westOfProperty'];
    image = json['image'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['typeOfProperty'] = typeOfProperty;
    data['address'] = address;
    data['khataNumber'] = khataNumber;
    data['northOfProperty'] = northOfProperty;
    data['southOfProperty'] = southOfProperty;
    data['eastOfProperty'] = eastOfProperty;
    data['westOfProperty'] = westOfProperty;
    data['image'] = image;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
