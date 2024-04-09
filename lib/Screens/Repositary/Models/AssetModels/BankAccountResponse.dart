class BankAccountResponse {
  Asset? asset;
  bool? success;
  String? message;

  BankAccountResponse({this.asset, this.success, this.message});

  BankAccountResponse.fromJson(Map<String, dynamic> json) {
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
  BankAccount? bankAccount;

  Asset({this.id, this.userId, this.category, this.bankAccount});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    bankAccount = json['BankAccount'] != null
        ? new BankAccount.fromJson(json['BankAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.bankAccount != null) {
      data['BankAccount'] = this.bankAccount!.toJson();
    }
    return data;
  }
}

class BankAccount {
  int? id;
  String? bankName;
  String? accountNumber;
  String? ifscCode;
  String? branchName;
  String? accountType;
  String? comments;
  String? attachment;
  int? assetId;

  BankAccount(
      {this.id,
        this.bankName,
        this.accountNumber,
        this.ifscCode,
        this.branchName,
        this.accountType,
        this.comments,
        this.attachment,
        this.assetId});

  BankAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    accountNumber = json['accountNumber'];
    ifscCode = json['ifscCode'];
    branchName = json['branchName'];
    accountType = json['accountType'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankName'] = this.bankName;
    data['accountNumber'] = this.accountNumber;
    data['ifscCode'] = this.ifscCode;
    data['branchName'] = this.branchName;
    data['accountType'] = this.accountType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
