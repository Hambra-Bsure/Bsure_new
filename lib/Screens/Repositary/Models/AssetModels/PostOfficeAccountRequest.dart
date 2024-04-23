class PostOfficeAccountRequest {
  late String assetType;
  late String branchName;
  String? accountNumber;
  late String accountType;
  String? comments;
  String? attachment;

  PostOfficeAccountRequest({
    required this.assetType,
    required this.branchName,
    this.accountNumber,
    required this.accountType,
    this.comments,
    this.attachment,
  });

  PostOfficeAccountRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    branchName = json['branchName'];
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = assetType;
    data['branchName'] = branchName;
    data['accountNumber'] = accountNumber;
    data['accountType'] = accountType;
    data['comments'] = comments;
    data['attachment'] = attachment;

    return data;
  }
}