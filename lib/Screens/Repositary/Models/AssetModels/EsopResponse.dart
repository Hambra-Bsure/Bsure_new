class EsopResponse {
  Asset? asset;
  bool? success;
  String? message;

  EsopResponse({this.asset, this.success, this.message});

  EsopResponse.fromJson(Map<String, dynamic> json) {
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
  Esop? esop;

  Asset({this.id, this.userId, this.category, this.attachmentId, this.esop});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    attachmentId = json['attachmentId'];
    esop = json['Esop'] != null ? new Esop.fromJson(json['Esop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    data['attachmentId'] = this.attachmentId;
    if (this.esop != null) {
      data['Esop'] = this.esop!.toJson();
    }
    return data;
  }
}

class Esop {
  int? id;
  String? companyName;
  int? numberOfStocks;
  int? optionPrice;
  String? expiryDate;
  int? totalSharesAvailableForIssue;
  int? issuePricePerShare;
  String? comments;
  String? attachment;
  int? assetId;

  Esop(
      {this.id,
        this.companyName,
        this.numberOfStocks,
        this.optionPrice,
        this.expiryDate,
        this.totalSharesAvailableForIssue,
        this.issuePricePerShare,
        this.comments,
        this.attachment,
        this.assetId});

  Esop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    numberOfStocks = json['numberOfStocks'];
    optionPrice = json['optionPrice'];
    expiryDate = json['expiryDate'];
    totalSharesAvailableForIssue = json['totalSharesAvailableForIssue'];
    issuePricePerShare = json['issuePricePerShare'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    data['numberOfStocks'] = this.numberOfStocks;
    data['optionPrice'] = this.optionPrice;
    data['expiryDate'] = this.expiryDate;
    data['totalSharesAvailableForIssue'] = this.totalSharesAvailableForIssue;
    data['issuePricePerShare'] = this.issuePricePerShare;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
