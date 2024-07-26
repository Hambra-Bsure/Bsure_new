class StockBrokerRequest {
  String? assetType;
  String? brokerName;
  String? dematAccountNumber;
  String? comments;
  String? attachment;

  StockBrokerRequest(
      {this.assetType,
        this.brokerName,
        this.dematAccountNumber,
        this.comments,
        this.attachment});

  StockBrokerRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    brokerName = json['brokerName'];
    dematAccountNumber = json['dematAccountNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['brokerName'] = brokerName;
    data['dematAccountNumber'] = dematAccountNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}