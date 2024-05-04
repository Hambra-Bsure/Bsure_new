class LifeInsuranceRequest {
  String? assetType;
  String? insuranceCompanyName;
  String? policyName;
  String? policyNumber;
  int? coverageAmount;
  String? maturityDate; // Change the type to String
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['insuranceCompanyName'] = insuranceCompanyName;
    data['policyName'] = policyName;
    data['policyNumber'] = policyNumber;
    data['coverageAmount'] = coverageAmount;
    data['maturityDate'] = maturityDate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}
