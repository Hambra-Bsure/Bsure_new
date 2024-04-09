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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['ppfAccountNumber'] = this.ppfAccountNumber;
    data['institutionName'] = this.institutionName;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
