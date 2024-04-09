class LifeInsuranceRequest {
  String? assetType;
  String? insuranceCompanyName;
  String? policyName;
  String? policyNumber;
  int? coverageAmount;
  String? maturityDate;
  String? comments;
  String? attachment;

  LifeInsuranceRequest(
      {this.assetType,
        this.insuranceCompanyName,
        this.policyName,
        this.policyNumber,
        this.coverageAmount,
        this.maturityDate,
        this.comments,
        this.attachment});

  LifeInsuranceRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    insuranceCompanyName = json['insuranceCompanyName'];
    policyName = json['policyName'];
    policyNumber = json['policyNumber'];
    coverageAmount = json['coverageAmount'];
    maturityDate = json['maturityDate'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['coverageAmount'] = this.coverageAmount;
    data['maturityDate'] = this.maturityDate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
