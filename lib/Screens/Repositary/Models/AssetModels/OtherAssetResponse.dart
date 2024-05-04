class OtherAssetResponse {
  Asset? asset;
  bool? success;
  String? message;

  OtherAssetResponse({this.asset, this.success, this.message});

  OtherAssetResponse.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (asset != null) {
      data['asset'] = asset!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
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
        ? OtherAssets.fromJson(json['OtherAssets'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (otherAssets != null) {
      data['OtherAssets'] = otherAssets!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assetName'] = assetName;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
