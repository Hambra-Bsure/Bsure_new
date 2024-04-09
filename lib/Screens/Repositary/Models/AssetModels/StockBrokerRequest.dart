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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['brokerName'] = this.brokerName;
    data['dematAccountNumber'] = this.dematAccountNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
