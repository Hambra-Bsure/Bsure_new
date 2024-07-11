class LifeInsuranceResponse {
  Asset? asset;
  bool? success;
  String? message;

  LifeInsuranceResponse({this.asset, this.success, this.message});

  LifeInsuranceResponse.fromJson(Map<String, dynamic> json) {
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
  LifeInsurance? lifeInsurance;

  Asset({this.id, this.userId, this.category, this.lifeInsurance});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'] ?? '';
    lifeInsurance = json['LifeInsurance'] != null
        ? LifeInsurance.fromJson(json['LifeInsurance'])
        : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (lifeInsurance != null) {
      data['LifeInsurance'] = lifeInsurance!.toJson();
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
  String? maturityDate;
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
    insuranceCompanyName = json['insuranceCompanyName'] ?? '';
    policyName = json['policyName'] ?? '';
    policyNumber = json['policyNumber'] ?? '';
    coverageAmount = json['coverageAmount'];
    maturityDate = json['maturityDate'] ?? '';
    comments = json['comments'] ?? '';
    attachment = json['attachment'] ?? '';
    assetId = json['assetId'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['insuranceCompanyName'] = insuranceCompanyName;
    data['policyName'] = policyName;
    data['policyNumber'] = policyNumber;
    data['coverageAmount'] = coverageAmount;
    data['maturityDate'] = maturityDate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
