class LoanGivenResponse {
  Asset? asset;
  bool? success;
  String? message;

  LoanGivenResponse({this.asset, this.success, this.message});

  LoanGivenResponse.fromJson(Map<String, dynamic> json) {
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
  LoanGiven? loanGiven;

  Asset({this.id, this.userId, this.category, this.loanGiven});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    loanGiven = json['LoanGiven'] != null
        ? LoanGiven.fromJson(json['LoanGiven'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (loanGiven != null) {
      data['LoanGiven'] = loanGiven!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['borrowerName'] = borrowerName;
    data['loanAmount'] = loanAmount;
    data['loanGivenDate'] = loanGivenDate;
    data['interestRate'] = interestRate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
