class NpsRequest {
  String? assetType;
  String? pranNumber;
  String? comments;
  String? attachment;

  NpsRequest({this.assetType, this.pranNumber, this.comments, this.attachment});

  NpsRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    pranNumber = json['pranNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['pranNumber'] = this.pranNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
