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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['typeOfInsurance'] = this.typeOfInsurance;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
