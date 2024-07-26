class CryptoExchangeRequest {
  String? assetType;
  String? exchangeName;
  String? accountNumber;
  String? walletAddress;
  String? comments;
  String? attachment;

  CryptoExchangeRequest(
      {this.assetType,
        this.exchangeName,
        this.accountNumber,
        this.walletAddress,
        this.comments,
        this.attachment});

  CryptoExchangeRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    exchangeName = json['exchangeName'];
    accountNumber = json['accountNumber'];
    walletAddress = json['walletAddress'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['exchangeName'] = exchangeName;
    data['accountNumber'] = accountNumber;
    data['walletAddress'] = walletAddress;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}