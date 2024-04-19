class LifeInsuranceRequest {
  String? assetType;
  String? insuranceCompanyName;
  String? policyName;
  String? policyNumber;
  int? coverageAmount;
  String maturityDate; // Change the type to String
  String? comments;
  String? attachment;

  LifeInsuranceRequest({
    this.assetType,
    this.insuranceCompanyName,
    this.policyName,
    this.policyNumber,
    this.coverageAmount,
    required this.maturityDate,
    this.comments,
    this.attachment,
  });

  LifeInsuranceRequest.fromJson(Map<String, dynamic> json)
      : maturityDate = json['maturityDate'] ?? '', // Provide a default value if null
        assetType = json['assetType'],
        insuranceCompanyName = json['insuranceCompanyName'],
        policyName = json['policyName'],
        policyNumber = json['policyNumber'],
        coverageAmount = json['coverageAmount'],
        comments = json['comments'],
        attachment = json['attachment'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['coverageAmount'] = this.coverageAmount;
    data['maturityDate'] = this.maturityDate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}
