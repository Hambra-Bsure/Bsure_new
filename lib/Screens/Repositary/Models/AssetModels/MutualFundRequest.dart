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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['amcName'] = amcName;
    data['schemeName'] = schemeName;
    data['folioNumber'] = folioNumber;
    data['fundType'] = fundType;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}