class GoldResponse {
  Asset? asset;
  bool? success;
  String? message;

  GoldResponse({this.asset, this.success, this.message});

  GoldResponse.fromJson(Map<String, dynamic> json) {
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
  Gold? gold;

  Asset({this.id, this.userId, this.category, this.gold});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    gold = json['Gold'] != null ? Gold.fromJson(json['Gold']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    if (gold != null) {
      data['Gold'] = gold!.toJson();
    }
    return data;
  }
}

class Gold {
  int? id;
  String? metalType;
  String? type;
  int? weightInGrams;
  String? whereItIsKept;
  String? comments;
  String? attachment;
  int? assetId;

  Gold(
      {this.id,
        this.metalType,
        this.type,
        this.weightInGrams,
        this.whereItIsKept,
        this.comments,
        this.attachment,
        this.assetId});

  Gold.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    metalType = json['metalType'];
    type = json['type'];
    weightInGrams = json['weightInGrams'];
    whereItIsKept = json['whereItIsKept'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['metalType'] = metalType;
    data['type'] = type;
    data['weightInGrams'] = weightInGrams;
    data['whereItIsKept'] = whereItIsKept;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}
