class PostOfficeAccountResponse {
  Asset? asset;
  bool? success;
  String? message;

  PostOfficeAccountResponse({this.asset, this.success, this.message});

  PostOfficeAccountResponse.fromJson(Map<String, dynamic> json) {
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
  PostOfficeAccount? postOfficeAccount;

  Asset({this.id, this.userId, this.category, this.postOfficeAccount});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    postOfficeAccount = json['PostOfficeAccount'] != null
        ? new PostOfficeAccount.fromJson(json['PostOfficeAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.postOfficeAccount != null) {
      data['PostOfficeAccount'] = this.postOfficeAccount!.toJson();
    }
    return data;
  }
}

class PostOfficeAccount {
  int? id;
  String? branchName;
  String? accountNumber;
  String? accountType;
  String? comments;
  String? attachment;
  int? assetId;

  PostOfficeAccount(
      {this.id,
        this.branchName,
        this.accountNumber,
        this.accountType,
        this.comments,
        this.attachment,
        this.assetId});

  PostOfficeAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branchName'];
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branchName'] = this.branchName;
    data['accountNumber'] = this.accountNumber;
    data['accountType'] = this.accountType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
