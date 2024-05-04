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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
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
    return data;
  }
}
