class PostOfficeAccountResponse {
  Asset? asset;
  bool? success;
  String? message;

  PostOfficeAccountResponse({this.asset, this.success, this.message});

  PostOfficeAccountResponse.fromJson(Map<String, dynamic> json) {
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
  PostOfficeAccount? postOfficeAccount;

  Asset({this.id, this.userId, this.category, this.postOfficeAccount});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    postOfficeAccount = json['PostOfficeAccount'] != null
        ? PostOfficeAccount.fromJson(json['PostOfficeAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (postOfficeAccount != null) {
      data['PostOfficeAccount'] = postOfficeAccount!.toJson();
    }
    return data;
  }
}

class PostOfficeAccount {
  int? id;
  String branchName;
  String? accountNumber;
  String accountType;
  String? comments;
  String? attachment;
  int? assetId;

  PostOfficeAccount({
    this.id,
    required this.branchName,
    required this.accountNumber,
    required this.accountType,
    this.comments,
    this.attachment,
    this.assetId,
  });

  PostOfficeAccount.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        branchName = json['branchName'],
        accountNumber = json['accountNumber'],
        accountType = json['accountType'],
        comments = json['comments'],
        attachment = json['attachment'],
        assetId = json['assetId'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branchName': branchName,
      'accountNumber': accountNumber,
      'accountType': accountType,
      'comments': comments,
      'attachment': attachment,
      'assetId': assetId,
    };
  }
}
