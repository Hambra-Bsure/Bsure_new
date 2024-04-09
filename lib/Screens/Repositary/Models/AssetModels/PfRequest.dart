class PfRequest {
  String? assetType;
  String? uanNumber;
  String? comments;
  String? attachment;

  PfRequest({this.assetType, this.uanNumber, this.comments, this.attachment});

  PfRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    uanNumber = json['uanNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['uanNumber'] = this.uanNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
