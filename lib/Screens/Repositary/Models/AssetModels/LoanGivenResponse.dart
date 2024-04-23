class LoanGivenResponse {
  Asset? asset;
  bool? success;
  String? message;

  LoanGivenResponse({this.asset, this.success, this.message});

  LoanGivenResponse.fromJson(Map<String, dynamic> json) {
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
  LoanGiven? loanGiven;

  Asset({this.id, this.userId, this.category, this.loanGiven});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    loanGiven = json['LoanGiven'] != null
        ? new LoanGiven.fromJson(json['LoanGiven'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.loanGiven != null) {
      data['LoanGiven'] = this.loanGiven!.toJson();
    }
    return data;
  }
}

class LoanGiven {
  int? id;
  String? borrowerName;
  int? loanAmount;
  String? loanGivenDate;
  int? interestRate;
  String? comments;
  String? attachment;
  int? assetId;

  LoanGiven(
      {this.id,
        this.borrowerName,
        this.loanAmount,
        this.loanGivenDate,
        this.interestRate,
        this.comments,
        this.attachment,
        this.assetId});

  LoanGiven.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    borrowerName = json['borrowerName'];
    loanAmount = json['loanAmount'];
    loanGivenDate = json['loanGivenDate'];
    interestRate = json['interestRate'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['borrowerName'] = this.borrowerName;
    data['loanAmount'] = this.loanAmount;
    data['loanGivenDate'] = this.loanGivenDate;
    data['interestRate'] = this.interestRate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
