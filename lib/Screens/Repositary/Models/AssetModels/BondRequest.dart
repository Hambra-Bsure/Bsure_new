class BondRequest {
  String? assetType;
  String? bondName;
  String? bondNumber;
  String? authorityWhoIssuedTheBond;
  String? typeOfBond;
  String? maturityDate;
  String? comments;
  String? attachment;

  BondRequest(
      {this.assetType,
        this.bondName,
        this.bondNumber,
        this.authorityWhoIssuedTheBond,
        this.typeOfBond,
        this.maturityDate,
        this.comments,
        this.attachment});

  BondRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    bondName = json['bondName'];
    bondNumber = json['bondNumber'];
    authorityWhoIssuedTheBond = json['authorityWhoIssuedTheBond'];
    typeOfBond = json['typeOfBond'];
    maturityDate = json['maturityDate'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['bondName'] = this.bondName;
    data['bondNumber'] = this.bondNumber;
    data['authorityWhoIssuedTheBond'] = this.authorityWhoIssuedTheBond;
    data['typeOfBond'] = this.typeOfBond;
    data['maturityDate'] = this.maturityDate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
