class OtherAssetResponse {
  Asset? asset;
  bool? success;
  String? message;

  OtherAssetResponse({this.asset, this.success, this.message});

  OtherAssetResponse.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.asset != null) {
      data['asset'] = this.asset!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Asset {
  int? id;
  int? userId;
  String? category;
  OtherAssets? otherAssets;

  Asset({this.id, this.userId, this.category, this.otherAssets});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    otherAssets = json['OtherAssets'] != null
        ? new OtherAssets.fromJson(json['OtherAssets'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.otherAssets != null) {
      data['OtherAssets'] = this.otherAssets!.toJson();
    }
    return data;
  }
}

class OtherAssets {
  int? id;
  String? assetName;
  String? comments;
  String? attachment;
  int? assetId;

  OtherAssets(
      {this.id, this.assetName, this.comments, this.attachment, this.assetId});

  OtherAssets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetName = json['assetName'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assetName'] = this.assetName;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
