class PostAssetResponse {
  final Asset asset;
  final bool success;
  final String message;

  PostAssetResponse({
    required this.asset,
    required this.success,
    required this.message,
  });

  factory PostAssetResponse.fromJson(Map<String, dynamic> json) {
    return PostAssetResponse(
      asset: Asset.fromJson(json['asset']),
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset.toJson(),
      'success': success,
      'message': message,
    };
  }
}

class Asset {
  final int userId;
  final int assetId;
  final String category;

  Asset({
    required this.userId,
    required this.assetId,
    required this.category,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      userId: json['userId'] as int,
      assetId: json['assetId'] as int,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'assetId': assetId,
      'category': category,
    };
  }
}

