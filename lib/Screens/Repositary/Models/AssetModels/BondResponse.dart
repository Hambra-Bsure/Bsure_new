class BondResponse {
  Asset? asset;
  bool? success;
  String? message;

  BondResponse({this.asset, this.success, this.message});

  BondResponse.fromJson(Map<String, dynamic> json) {
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
  Null? attachmentId;
  Bond? bond;

  Asset({this.id, this.userId, this.category, this.attachmentId, this.bond});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    attachmentId = json['attachmentId'];
    bond = json['Bond'] != null ? new Bond.fromJson(json['Bond']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    data['attachmentId'] = this.attachmentId;
    if (this.bond != null) {
      data['Bond'] = this.bond!.toJson();
    }
    return data;
  }
}

class Bond {
  int? id;
  String? bondName;
  String? bondNumber;
  String? authorityWhoIssuedTheBond;
  String? typeOfBond;
  String? maturityDate;
  String? comments;
  String? attachment;
  int? assetId;

  Bond(
      {this.id,
        this.bondName,
        this.bondNumber,
        this.authorityWhoIssuedTheBond,
        this.typeOfBond,
        this.maturityDate,
        this.comments,
        this.attachment,
        this.assetId});

  Bond.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bondName = json['bondName'];
    bondNumber = json['bondNumber'];
    authorityWhoIssuedTheBond = json['authorityWhoIssuedTheBond'];
    typeOfBond = json['typeOfBond'];
    maturityDate = json['maturityDate'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bondName'] = this.bondName;
    data['bondNumber'] = this.bondNumber;
    data['authorityWhoIssuedTheBond'] = this.authorityWhoIssuedTheBond;
    data['typeOfBond'] = this.typeOfBond;
    data['maturityDate'] = this.maturityDate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
