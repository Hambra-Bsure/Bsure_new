class BankAccountResponse {
  Asset? asset;
  bool? success;
  String? message;

  BankAccountResponse({this.asset, this.success, this.message});

  BankAccountResponse.fromJson(Map<String, dynamic> json) {
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
  BankAccount? bankAccount;

  Asset({this.id, this.userId, this.category, this.bankAccount});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    bankAccount = json['BankAccount'] != null
        ? BankAccount.fromJson(json['BankAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (bankAccount != null) {
      data['BankAccount'] = bankAccount!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bankName'] = bankName;
    data['accountNumber'] = accountNumber;
    data['ifscCode'] = ifscCode;
    data['branchName'] = branchName;
    data['accountType'] = accountType;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
