class MyShareAssetsResponse {
  bool? success;
  List<MyAsset>? assets;

  MyShareAssetsResponse({this.success, this.assets});

  factory MyShareAssetsResponse.fromJson(Map<String, dynamic> json) {
    return MyShareAssetsResponse(
      success: json['success'] as bool?,
      assets: (json['assets'] as List<dynamic>?)
          ?.map((item) => MyAsset.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [], // default to an empty list if null
    );
  }
}

class MyAsset {
  int id;
  String category;
  List<Detail>? details;
  List<Nominee>? nominees;

  MyAsset({
    required this.id,
    required this.category,
    this.details,
    this.nominees,
  });

  factory MyAsset.fromJson(Map<String, dynamic> json) {
    return MyAsset(
      id: json['id'] as int,
      category: json['category'] as String,
      details: (json['details'] as List<dynamic>?)
          ?.map((item) => Detail.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [], // default to an empty list if null
      nominees: (json['nominees'] as List<dynamic>?)
          ?.map((item) => Nominee.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [], // default to an empty list if null
    );
  }
}

class Detail {
  String fieldName;
  String? fieldValue;

  Detail({required this.fieldName, this.fieldValue});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      fieldName: json['fieldName'] as String,
      fieldValue:
      json['fieldValue'] != null ? json['fieldValue'].toString() : null,
      // Convert fieldValue to a string using toString(), or handle null case appropriately
    );
  }
}

class Nominee {
  String firstName;
  String lastName;
  int sharedAssetId;

  Nominee(
      {required this.firstName,
        required this.lastName,
        required this.sharedAssetId});

  factory Nominee.fromJson(Map<String, dynamic> json) {
    return Nominee(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      sharedAssetId: json['sharedAssetId'] as int,
    );
  }
}
