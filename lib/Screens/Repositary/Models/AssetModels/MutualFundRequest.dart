class MutualFundRequest {
  String? assetType;
  String? amcName;
  String? schemeName;
  String? folioNumber;
  String? fundType;
  String? comments;
  String? attachment;

  MutualFundRequest(
      {this.assetType,
        this.amcName,
        this.schemeName,
        this.folioNumber,
        this.fundType,
        this.comments,
        this.attachment});

  MutualFundRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    amcName = json['amcName'];
    schemeName = json['schemeName'];
    folioNumber = json['folioNumber'];
    fundType = json['fundType'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['amcName'] = this.amcName;
    data['schemeName'] = this.schemeName;
    data['folioNumber'] = this.folioNumber;
    data['fundType'] = this.fundType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
