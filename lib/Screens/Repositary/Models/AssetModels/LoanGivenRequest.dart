class LoanGivenRequest {
  String? assetType;
  String? borrowerName;
  int? loanAmount;
  String? loanGivenDate;
  int? interestRate;
  String? comments;
  String? attachment;

  LoanGivenRequest(
      {this.assetType,
        this.borrowerName,
        this.loanAmount,
        this.loanGivenDate,
        this.interestRate,
        this.comments,
        this.attachment});

  LoanGivenRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    borrowerName = json['borrowerName'];
    loanAmount = json['loanAmount'];
    loanGivenDate = json['loanGivenDate'];
    interestRate = json['interestRate'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['borrowerName'] = this.borrowerName;
    data['loanAmount'] = this.loanAmount;
    data['loanGivenDate'] = this.loanGivenDate;
    data['interestRate'] = this.interestRate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
