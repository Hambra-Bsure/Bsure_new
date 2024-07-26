class BondRequest {
  String? assetType;
  String? bondName;
  String? bondNumber;
  String? authorityWhoIssuedTheBond;
  String? typeOfBond;
  String? maturityDate; // Make maturityDate nullable
  String? comments;
  String? attachment;

  BondRequest({
    this.assetType,
    this.bondName,
    this.bondNumber,
    this.authorityWhoIssuedTheBond,
    this.typeOfBond,
    this.maturityDate = '', // Provide a default value for maturityDate
    this.comments,
    this.attachment,
  });

  BondRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    bondName = json['bondName'];
    bondNumber = json['bondNumber'];
    authorityWhoIssuedTheBond = json['authorityWhoIssuedTheBond'];
    typeOfBond = json['typeOfBond'];
    maturityDate = json['maturityDate'] ?? ''; // Update maturityDate assignment
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['assetType'] = assetType;
    data['bondName'] = bondName;
    data['bondNumber'] = bondNumber;
    data['authorityWhoIssuedTheBond'] = authorityWhoIssuedTheBond;
    data['typeOfBond'] = typeOfBond;
    data['maturityDate'] = maturityDate; // Update maturityDate assignment
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}