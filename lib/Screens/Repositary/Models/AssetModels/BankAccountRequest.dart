import '../../../Assets/BankAccount.dart';

class BankAccountRequest {
  final String assetType;
  final String bankName;
  final String? accountNumber;
  final String? ifscCode;
  final String branchName;
  final AccountType accountType;
  final String? comments;
  final String? attachment;

  BankAccountRequest({
    required this.assetType,
    required this.bankName,
    this.accountNumber,
    this.ifscCode,
    required this.branchName,
    required this.accountType,
    this.comments,
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    return {
      'assetType': assetType,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'ifscCode': ifscCode,
      'branchName': branchName,
      'accountType': accountTypeToString(accountType),
      'comments': comments,
      'attachment': attachment,
    };
  }
}
