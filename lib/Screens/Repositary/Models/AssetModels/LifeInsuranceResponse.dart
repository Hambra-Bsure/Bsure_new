class LifeInsuranceResponse {
  Asset? asset;
  bool? success;
  String? message;

  LifeInsuranceResponse({this.asset, this.success, this.message});

  LifeInsuranceResponse.fromJson(Map<String, dynamic> json) {
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
  LifeInsurance? lifeInsurance;

  Asset({this.id, this.userId, this.category, this.lifeInsurance});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    lifeInsurance = json['LifeInsurance'] != null
        ? new LifeInsurance.fromJson(json['LifeInsurance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.lifeInsurance != null) {
      data['LifeInsurance'] = this.lifeInsurance!.toJson();
    }
    return data;
  }
}

class LifeInsurance {
  int? id;
  String? insuranceCompanyName;
  String? policyName;
  String? policyNumber;
  int? coverageAmount;
  Null? maturityDate;
  String? comments;
  String? attachment;
  int? assetId;

  LifeInsurance(
      {this.id,
        this.insuranceCompanyName,
        this.policyName,
        this.policyNumber,
        this.coverageAmount,
        this.maturityDate,
        this.comments,
        this.attachment,
        this.assetId});

  LifeInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insuranceCompanyName = json['insuranceCompanyName'];
    policyName = json['policyName'];
    policyNumber = json['policyNumber'];
    coverageAmount = json['coverageAmount'];
    maturityDate = json['maturityDate'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['coverageAmount'] = this.coverageAmount;
    data['maturityDate'] = this.maturityDate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
