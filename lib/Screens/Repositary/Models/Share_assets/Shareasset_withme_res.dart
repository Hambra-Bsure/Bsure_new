class ShareAssetswithmeResponse {
  bool? success;
  String? message;
  List<AssetDetails>? assetDetailsList;

  ShareAssetswithmeResponse({
    this.success,
    this.message,
    this.assetDetailsList,
  });

  factory ShareAssetswithmeResponse.fromJson(Map<String, dynamic> json) {
    return ShareAssetswithmeResponse(
      success: json['success'],
      message: json['message'],
      assetDetailsList: List<AssetDetails>.from(
        json['assetDetailsList']?.map((x) => AssetDetails.fromJson(x)) ?? [],
      ),
    );
  }
}

class AssetDetails {
  String? userName;
  String? mobileNumber;
  int? uaiUserId;
  int? uaiAssetSubId;
  int? uaiAssetId;
  String? uaiCreatedAt;
  List<Map<String, dynamic>>? assetDataList;

  AssetDetails({
    this.userName,
    this.mobileNumber,
    this.uaiUserId,
    this.uaiAssetSubId,
    this.uaiAssetId,
    this.uaiCreatedAt,
    this.assetDataList,
  });

  factory AssetDetails.fromJson(Map<String, dynamic> json) {
    return AssetDetails(
      userName: json['userName'],
      mobileNumber: json['mobileNumber'],
      uaiUserId: json['uaiUserId'],
      uaiAssetSubId: json['uaiAssetSubId'],
      uaiAssetId: json['uaiAssetId'],
      uaiCreatedAt: json['uaiCreatedAt'],
      assetDataList: List<Map<String, dynamic>>.from(
        json.keys.where((key) =>
        key != 'userName' &&
            key != 'mobileNumber' &&
            key != 'uaiUserId' &&
            key != 'uaiAssetSubId' &&
            key != 'uaiAssetId' &&
            key != 'uaiCreatedAt')
            .map((key) => {
          'uaiId': key,
          'uaiValue': json[key],
          'displayName': key,
        }),
      ),
    );
  }
}
