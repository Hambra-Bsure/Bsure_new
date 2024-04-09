class ApiResponse {
  final int id;
  final int userId;
  final String category;
  final BankAccount bankAccount;

  ApiResponse({
    required this.id,
    required this.userId,
    required this.category,
    required this.bankAccount,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      id: json['id'],
      userId: json['userId'],
      category: json['category'],
      bankAccount: BankAccount.fromJson(json['BankAccount']),
    );
  }
}

class BankAccount {
  final int id;
  final String bankName;
  final String accountNumber;
  final String ifscCode;
  final String branchName;
  final String accountType;
  final String comments;
  final String attachment;
  final int assetId;

  BankAccount({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.ifscCode,
    required this.branchName,
    required this.accountType,
    required this.comments,
    required this.attachment,
    required this.assetId,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      id: json['id'],
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      ifscCode: json['ifscCode'],
      branchName: json['branchName'],
      accountType: json['accountType'],
      comments: json['comments'],
      attachment: json['attachment'],
      assetId: json['assetId'],
    );
  }
}
