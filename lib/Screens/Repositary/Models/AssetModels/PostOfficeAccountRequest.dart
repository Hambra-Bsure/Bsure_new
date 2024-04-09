enum AccountType { Current, Saving }

class PostOfficeAccountRequest {
  String? assetType;
  String? branchName;
  String? accountNumber;
  AccountType? accountType; // Updated to AccountType
  String? comments;
  String? attachment;

  PostOfficeAccountRequest({
    this.assetType,
    this.branchName,
    this.accountNumber,
    required this.accountType,
    this.comments,
    this.attachment,
  });

  PostOfficeAccountRequest.fromJson(Map<String, dynamic> json)
      : assetType = json['assetType'],
        branchName = json['branchName'],
        accountNumber = json['accountNumber'],
        accountType = _parseAccountType(json['accountType']), // Direct assignment to enum
        comments = json['comments'],
        attachment = json['attachment'];

  Map<String, dynamic> toJson() {
    return {
      'assetType': assetType,
      'branchName': branchName,
      'accountNumber': accountNumber,
      'accountType': accountType?.toString().split('.').last, // Handling enum properly
      'comments': comments,
      'attachment': attachment,
    };
  }

  static AccountType? _parseAccountType(String? value) {
    if (value == 'current') {
      return AccountType.Current;
    } else if (value == 'saving') {
      return AccountType.Saving;
    } else {
      return null; // Return null if not recognized
    }
  }

  static List<AccountType> get validAccountTypes =>
      AccountType.values.toList(); // Return list of AccountType enum values

  bool isValidAccountType() {
    return validAccountTypes.contains(accountType);
  }
}
