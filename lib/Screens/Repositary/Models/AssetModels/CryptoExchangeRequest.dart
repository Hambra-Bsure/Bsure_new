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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['exchangeName'] = this.exchangeName;
    data['accountNumber'] = this.accountNumber;
    data['walletAddress'] = this.walletAddress;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
