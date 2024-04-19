class PostOfficeAccountRequest {
  final String assetType;
  final String branchName;
  final String? accountNumber;
  final String accountType;
  final String? comments;
  final String? attachment;

  PostOfficeAccountRequest({
    required this.assetType,
    required this.branchName,
    this.accountNumber,
    required this.accountType,
    this.comments,
    this.attachment,
  });

  factory PostOfficeAccountRequest.fromJson(Map<String, dynamic> json) {
    return PostOfficeAccountRequest(
      assetType: json['assetType'],
      branchName: json['branchName'],
      accountNumber: json['accountNumber'],
      accountType: json['accountType'],
      comments: json['comments'],
      attachment: json['attachment'],
    );
  }
}
