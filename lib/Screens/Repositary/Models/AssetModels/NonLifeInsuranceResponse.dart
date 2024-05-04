class NonLifeInsuranceResponse {
  Asset? asset;
  bool? success;
  String? message;

  NonLifeInsuranceResponse({this.asset, this.success, this.message});

  NonLifeInsuranceResponse.fromJson(Map<String, dynamic> json) {
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
  NonLifeInsurance? nonLifeInsurance;

  Asset({this.id, this.userId, this.category, this.nonLifeInsurance});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    nonLifeInsurance = json['NonLifeInsurance'] != null
        ? NonLifeInsurance.fromJson(json['NonLifeInsurance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (nonLifeInsurance != null) {
      data['NonLifeInsurance'] = nonLifeInsurance!.toJson();
    }
    return data;
  }
}

class NonLifeInsurance {
  int? id;
  String? insuranceCompanyName;
  String? typeOfInsurance;
  String? policyName;
  String? policyNumber;
  String? comments;
  String? attachment;
  int? assetId;

  NonLifeInsurance(
      {this.id,
        this.insuranceCompanyName,
        this.typeOfInsurance,
        this.policyName,
        this.policyNumber,
        this.comments,
        this.attachment,
        this.assetId});

  NonLifeInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insuranceCompanyName = json['insuranceCompanyName'];
    typeOfInsurance = json['typeOfInsurance'];
    policyName = json['policyName'];
    policyNumber = json['policyNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['insuranceCompanyName'] = insuranceCompanyName;
    data['typeOfInsurance'] = typeOfInsurance;
    data['policyName'] = policyName;
    data['policyNumber'] = policyNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
