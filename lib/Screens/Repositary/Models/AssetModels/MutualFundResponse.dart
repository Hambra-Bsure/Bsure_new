class MutualFundResponse {
  Asset? asset;
  bool? success;
  String? message;

  MutualFundResponse({this.asset, this.success, this.message});

  MutualFundResponse.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.asset != null) {
      data['asset'] = this.asset!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Asset {
  int? id;
  int? userId;
  String? category;
  MutualFund? mutualFund;

  Asset({this.id, this.userId, this.category, this.mutualFund});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    mutualFund = json['MutualFund'] != null
        ? new MutualFund.fromJson(json['MutualFund'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.mutualFund != null) {
      data['MutualFund'] = this.mutualFund!.toJson();
    }
    return data;
  }
}

class MutualFund {
  int? id;
  String? amcName;
  String? schemeName;
  String? folioNumber;
  String? fundType;
  String? comments;
  String? attachment;
  int? assetId;

  MutualFund(
      {this.id,
        this.amcName,
        this.schemeName,
        this.folioNumber,
        this.fundType,
        this.comments,
        this.attachment,
        this.assetId});

  MutualFund.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amcName = json['amcName'];
    schemeName = json['schemeName'];
    folioNumber = json['folioNumber'];
    fundType = json['fundType'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amcName'] = this.amcName;
    data['schemeName'] = this.schemeName;
    data['folioNumber'] = this.folioNumber;
    data['fundType'] = this.fundType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
