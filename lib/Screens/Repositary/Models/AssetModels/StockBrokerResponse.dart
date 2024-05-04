class StockBrokerResponse {
  Asset? asset;
  bool? success;
  String? message;

  StockBrokerResponse({this.asset, this.success, this.message});

  StockBrokerResponse.fromJson(Map<String, dynamic> json) {
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
  StockBroker? stockBroker;

  Asset({this.id, this.userId, this.category, this.stockBroker});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    stockBroker = json['StockBroker'] != null
        ? StockBroker.fromJson(json['StockBroker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (stockBroker != null) {
      data['StockBroker'] = stockBroker!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brokerName'] = brokerName;
    data['dematAccountNumber'] = dematAccountNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
