class NonLifeInsuranceRequest {
  String? assetType;
  String? insuranceCompanyName;
  String? typeOfInsurance;
  String? policyName;
  String? policyNumber;
  String? comments;
  String? attachment;

  NonLifeInsuranceRequest(
      {this.assetType,
        this.insuranceCompanyName,
        this.typeOfInsurance,
        this.policyName,
        this.policyNumber,
        this.comments,
        this.attachment});

  NonLifeInsuranceRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    insuranceCompanyName = json['insuranceCompanyName'];
    typeOfInsurance = json['typeOfInsurance'];
    policyName = json['policyName'];
    policyNumber = json['policyNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['insuranceCompanyName'] = insuranceCompanyName;
    data['typeOfInsurance'] = typeOfInsurance;
    data['policyName'] = policyName;
    data['policyNumber'] = policyNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}