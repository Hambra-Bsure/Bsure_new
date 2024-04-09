class CryptoExchangeResponse {
  Asset? asset;
  bool? success;
  String? message;

  CryptoExchangeResponse({this.asset, this.success, this.message});

  CryptoExchangeResponse.fromJson(Map<String, dynamic> json) {
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
  CryptoExchange? cryptoExchange;

  Asset({this.id, this.userId, this.category, this.cryptoExchange});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    cryptoExchange = json['CryptoExchange'] != null
        ? new CryptoExchange.fromJson(json['CryptoExchange'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.cryptoExchange != null) {
      data['CryptoExchange'] = this.cryptoExchange!.toJson();
    }
    return data;
  }
}

class CryptoExchange {
  int? id;
  String? exchangeName;
  String? accountNumber;
  String? walletAddress;
  String? comments;
  String? attachment;
  int? assetId;

  CryptoExchange(
      {this.id,
        this.exchangeName,
        this.accountNumber,
        this.walletAddress,
        this.comments,
        this.attachment,
        this.assetId});

  CryptoExchange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exchangeName = json['exchangeName'];
    accountNumber = json['accountNumber'];
    walletAddress = json['walletAddress'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exchangeName'] = this.exchangeName;
    data['accountNumber'] = this.accountNumber;
    data['walletAddress'] = this.walletAddress;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
