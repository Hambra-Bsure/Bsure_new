class GetBankResponse {
  bool? success;
  String? message;
  List<Assets>? assets;

  GetBankResponse({this.success, this.message, this.assets});

  GetBankResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (assets != null) {
      data['assets'] = assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  String? category;
  String? bankName;
  String? accountNumber;
  String? ifscCode;
  String? branchName;
  String? accountType;
  String? comments;
  String? attachment;
  int? assetId;

  Assets(
      {this.category,
        this.bankName,
        this.accountNumber,
        this.ifscCode,
        this.branchName,
        this.accountType,
        this.comments,
        this.attachment,
        this.assetId});

  Assets.fromJson(Map<String, dynamic> json) {
    category = json['category'];
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
    data['category'] = category;
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