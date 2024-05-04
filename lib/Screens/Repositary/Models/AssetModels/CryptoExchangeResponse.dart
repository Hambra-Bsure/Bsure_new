class CryptoExchangeResponse {
  Asset? asset;
  bool? success;
  String? message;

  CryptoExchangeResponse({this.asset, this.success, this.message});

  CryptoExchangeResponse.fromJson(Map<String, dynamic> json) {
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
  CryptoExchange? cryptoExchange;

  Asset({this.id, this.userId, this.category, this.cryptoExchange});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    cryptoExchange = json['CryptoExchange'] != null
        ? CryptoExchange.fromJson(json['CryptoExchange'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (cryptoExchange != null) {
      data['CryptoExchange'] = cryptoExchange!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exchangeName'] = exchangeName;
    data['accountNumber'] = accountNumber;
    data['walletAddress'] = walletAddress;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
