class ShareAssetsnewrequest {
  List<ShareAssetsreq>? shareAssets;

  ShareAssetsnewrequest({this.shareAssets});

  ShareAssetsnewrequest.fromJson(Map<String, dynamic> json) {
    if (json['shareAssets'] != null) {
      shareAssets = <ShareAssetsreq>[]; // Use ShareAssetsreq here
      json['shareAssets'].forEach((v) {
        shareAssets!.add(ShareAssetsreq.fromJson(v)); // Use ShareAssetsreq here
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.shareAssets != null) {
      data['shareAssets'] = this.shareAssets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShareAssetsreq {
  int? assetId;
  List<int>? nomineeIds;

  // Correct constructor name
  ShareAssetsreq({this.assetId, this.nomineeIds}); // Use ShareAssetsreq here

  ShareAssetsreq.fromJson(Map<String, dynamic> json) {
    assetId = json['assetId'];
    nomineeIds = json['nomineeIds']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetId'] = this.assetId;
    data['nomineeIds'] = this.nomineeIds;
    return data;
  }
}