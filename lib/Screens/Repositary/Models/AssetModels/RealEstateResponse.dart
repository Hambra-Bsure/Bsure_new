class RealEstateResponse {
  Asset? asset;
  bool? success;
  String? message;

  RealEstateResponse({this.asset, this.success, this.message});

  RealEstateResponse.fromJson(Map<String, dynamic> json) {
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
  RealEstate? realEstate;

  Asset({this.id, this.userId, this.category, this.realEstate});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    realEstate = json['RealEstate'] != null
        ? new RealEstate.fromJson(json['RealEstate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.realEstate != null) {
      data['RealEstate'] = this.realEstate!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typeOfProperty'] = this.typeOfProperty;
    data['address'] = this.address;
    data['khataNumber'] = this.khataNumber;
    data['northOfProperty'] = this.northOfProperty;
    data['southOfProperty'] = this.southOfProperty;
    data['eastOfProperty'] = this.eastOfProperty;
    data['westOfProperty'] = this.westOfProperty;
    data['image'] = this.image;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
