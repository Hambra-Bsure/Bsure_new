class MutualFundResponse {
  Asset? asset;
  bool? success;
  String? message;

  MutualFundResponse({this.asset, this.success, this.message});

  MutualFundResponse.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (asset != null) {
      data['asset'] = asset!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
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
        ? MutualFund.fromJson(json['MutualFund'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (mutualFund != null) {
      data['MutualFund'] = mutualFund!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amcName'] = amcName;
    data['schemeName'] = schemeName;
    data['folioNumber'] = folioNumber;
    data['fundType'] = fundType;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
