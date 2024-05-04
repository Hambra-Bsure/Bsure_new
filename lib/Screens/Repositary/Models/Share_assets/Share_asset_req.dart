class ShareAssetRequest {
  List<int>? nomineeIds;
  List<int>? assetIds;

  ShareAssetRequest({this.nomineeIds, this.assetIds});

  ShareAssetRequest.fromJson(Map<String, dynamic> json) {
    nomineeIds = json['nomineeIds'];
    assetIds = json['assetIds']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomineeIds'] = nomineeIds;
    data['assetIds'] = assetIds;
    return data;
  }
}
