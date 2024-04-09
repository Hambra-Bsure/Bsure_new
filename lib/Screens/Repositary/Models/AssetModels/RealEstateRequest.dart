class RealEstateRequest {
  String? assetType;
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

  RealEstateRequest(
      {this.assetType,
        this.typeOfProperty,
        this.address,
        this.khataNumber,
        this.northOfProperty,
        this.southOfProperty,
        this.eastOfProperty,
        this.westOfProperty,
        this.image,
        this.comments,
        this.attachment});

  RealEstateRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    typeOfProperty = json['typeOfProperty'].cast<String>();
    address = json['address'];
    khataNumber = json['khataNumber'];
    northOfProperty = json['northOfProperty'];
    southOfProperty = json['southOfProperty'];
    eastOfProperty = json['eastOfProperty'];
    westOfProperty = json['westOfProperty'];
    image = json['image'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
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
    return data;
  }
}
