class ShareAssetsnewresponse {
  bool? success;
  String? message;
  List<ShareAssets>? shareAssets;

  ShareAssetsnewresponse({this.success, this.message, this.shareAssets});

  ShareAssetsnewresponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['shareAssets'] != null) {
      shareAssets = <ShareAssets>[];
      json['shareAssets'].forEach((v) {
        shareAssets!.add(new ShareAssets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.shareAssets != null) {
      data['shareAssets'] = this.shareAssets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShareAssets {
  int? assetId;
  List<int>? nomineeIds;

  ShareAssets({this.assetId, this.nomineeIds});

  ShareAssets.fromJson(Map<String, dynamic> json) {
    assetId = json['assetId'];
    nomineeIds = json['nomineeIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetId'] = this.assetId;
    data['nomineeIds'] = this.nomineeIds;
    return data;
  }
}
