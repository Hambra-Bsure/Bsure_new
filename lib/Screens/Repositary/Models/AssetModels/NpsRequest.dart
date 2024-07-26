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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['pranNumber'] = pranNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}