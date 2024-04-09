class EsopRequest {
  String? assetType;
  String? companyName;
  int? numberOfStocks;
  int? optionPrice;
  String? expiryDate;
  int? totalSharesAvailableForIssue;
  int? issuePricePerShare;
  String? comments;
  String? attachment;

  EsopRequest(
      {this.assetType,
        this.companyName,
        this.numberOfStocks,
        this.optionPrice,
        this.expiryDate,
        this.totalSharesAvailableForIssue,
        this.issuePricePerShare,
        this.comments,
        this.attachment});

  EsopRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    companyName = json['companyName'];
    numberOfStocks = json['numberOfStocks'];
    optionPrice = json['optionPrice'];
    expiryDate = json['expiryDate'];
    totalSharesAvailableForIssue = json['totalSharesAvailableForIssue'];
    issuePricePerShare = json['issuePricePerShare'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['companyName'] = this.companyName;
    data['numberOfStocks'] = this.numberOfStocks;
    data['optionPrice'] = this.optionPrice;
    data['expiryDate'] = this.expiryDate;
    data['totalSharesAvailableForIssue'] = this.totalSharesAvailableForIssue;
    data['issuePricePerShare'] = this.issuePricePerShare;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
