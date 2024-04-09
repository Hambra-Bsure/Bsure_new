class StockBrokerResponse {
  Asset? asset;
  bool? success;
  String? message;

  StockBrokerResponse({this.asset, this.success, this.message});

  StockBrokerResponse.fromJson(Map<String, dynamic> json) {
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
  StockBroker? stockBroker;

  Asset({this.id, this.userId, this.category, this.stockBroker});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    stockBroker = json['StockBroker'] != null
        ? new StockBroker.fromJson(json['StockBroker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.stockBroker != null) {
      data['StockBroker'] = this.stockBroker!.toJson();
    }
    return data;
  }
}

class StockBroker {
  int? id;
  String? brokerName;
  String? dematAccountNumber;
  String? comments;
  String? attachment;
  int? assetId;

  StockBroker(
      {this.id,
        this.brokerName,
        this.dematAccountNumber,
        this.comments,
        this.attachment,
        this.assetId});

  StockBroker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brokerName = json['brokerName'];
    dematAccountNumber = json['dematAccountNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brokerName'] = this.brokerName;
    data['dematAccountNumber'] = this.dematAccountNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
