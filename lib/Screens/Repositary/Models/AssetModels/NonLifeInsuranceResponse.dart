class NonLifeInsuranceResponse {
  Asset? asset;
  bool? success;
  String? message;

  NonLifeInsuranceResponse({this.asset, this.success, this.message});

  NonLifeInsuranceResponse.fromJson(Map<String, dynamic> json) {
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
  NonLifeInsurance? nonLifeInsurance;

  Asset({this.id, this.userId, this.category, this.nonLifeInsurance});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    nonLifeInsurance = json['NonLifeInsurance'] != null
        ? new NonLifeInsurance.fromJson(json['NonLifeInsurance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.nonLifeInsurance != null) {
      data['NonLifeInsurance'] = this.nonLifeInsurance!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['typeOfInsurance'] = this.typeOfInsurance;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
