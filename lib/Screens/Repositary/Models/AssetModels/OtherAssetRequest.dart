class OtherAssetRequest {
  String? assetType;
  String? assetName;
  String? comments;
  String? attachment;

  OtherAssetRequest(
      {this.assetType, this.assetName, this.comments, this.attachment});

  OtherAssetRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    assetName = json['assetName'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['assetName'] = assetName;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}