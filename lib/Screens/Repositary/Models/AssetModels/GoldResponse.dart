class GoldResponse {
  Asset? asset;
  bool? success;
  String? message;

  GoldResponse({this.asset, this.success, this.message});

  GoldResponse.fromJson(Map<String, dynamic> json) {
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
  Gold? gold;

  Asset({this.id, this.userId, this.category, this.gold});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    gold = json['Gold'] != null ? new Gold.fromJson(json['Gold']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    if (this.gold != null) {
      data['Gold'] = this.gold!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['metalType'] = this.metalType;
    data['type'] = this.type;
    data['weightInGrams'] = this.weightInGrams;
    data['whereItIsKept'] = this.whereItIsKept;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
