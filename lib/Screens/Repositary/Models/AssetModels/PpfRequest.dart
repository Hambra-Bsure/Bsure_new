class PpfRequest {
  String? assetType;
  String? ppfAccountNumber;
  String? institutionName;
  String? comments;
  String? attachment;

  PpfRequest(
      {this.assetType,
        this.ppfAccountNumber,
        this.institutionName,
        this.comments,
        this.attachment});

  PpfRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    ppfAccountNumber = json['ppfAccountNumber'];
    institutionName = json['institutionName'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['ppfAccountNumber'] = ppfAccountNumber;
    data['institutionName'] = institutionName;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}