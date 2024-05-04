// To parse this JSON data, do
//
//     final assetsResponse2 = assetsResponse2FromJson(jsonString);


// AssetsResponse2 assetsResponse2FromJson(String str) => AssetsResponse2.fromJson(json.decode(str));

// String assetsResponse2ToJson(AssetsResponse2 data) => json.encode(data.toJson());

class AssetsResponse2 {
    final bool isValid;
    final String message;
    final List<Asset> assets;

    AssetsResponse2({
        required this.isValid,
        required this.message,
        required this.assets,
    });

    factory AssetsResponse2.fromJson(Map<String, dynamic> json) => AssetsResponse2(
        isValid: json["isValid"],
        message: json["message"],
        assets: List<Asset>.from(json["assets"].map((x) => Asset.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isValid": isValid,
        "message": message,
        "assets": List<dynamic>.from(assets.map((x) => x.toJson())),
    };
}

class   Asset {
    final int userId;
    final int uamId;
    final List<AssetsList> assetsList;
    bool isSelected;

    Asset({
        required this.userId,
        required this.uamId,
        required this.assetsList,
        this.isSelected = false,
    });

    factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        userId: json["userId"],
        uamId: json["uamId"],
        assetsList: List<AssetsList>.from(json["assetsList"].map((x) => AssetsList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "uamId": uamId,
        "assetsList": List<dynamic>.from(assetsList.map((x) => x.toJson())),
    };
}

class AssetsList {
    final String type;
    final String label;
    final String categoryName;
    final String value;
    final int assetSubId;
    final int userAssetMapId;

    AssetsList({
        required this.type,
        required this.label,
        required this.categoryName,
        required this.value,
        required this.assetSubId,
        required this.userAssetMapId,
    });

    factory AssetsList.fromJson(Map<String, dynamic> json) => AssetsList(
        type: json["type"],
        label: json["label"],
        categoryName: json["categoryName"],
        value: json["value"],
        assetSubId: json["assetSubId"],
        userAssetMapId: json["userAssetMapId"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "categoryName": categoryName,
        "value": value,
        "assetSubId": assetSubId,
        "userAssetMapId": userAssetMapId,
    };
}