class LoanGivenRequest {
  String? assetType;
  String? borrowerName;
  int? loanAmount;
  String? loanGivenDate; // Make it nullable
  int? interestRate; // Make it nullable
  String? comments;
  String? attachment;

  LoanGivenRequest({
    this.assetType,
    this.borrowerName,
    this.loanAmount,
    this.loanGivenDate,
    this.interestRate,
    this.comments,
    this.attachment,
  });

  LoanGivenRequest.fromJson(Map<String, dynamic> json)
      : assetType = json['assetType'],
        borrowerName = json['borrowerName'],
        loanAmount = json['loanAmount'],
        loanGivenDate = json['loanGivenDate'],
        interestRate = json['interestRate'],
        comments = json['comments'],
        attachment = json['attachment'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['borrowerName'] = borrowerName;
    data['loanAmount'] = loanAmount;
    data['loanGivenDate'] = loanGivenDate;
    data['interestRate'] = interestRate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}