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
        assets!.add(new Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
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
