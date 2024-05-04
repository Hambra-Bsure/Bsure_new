class DigitalwillgetResponse {
  List<Assets>? assets;

  DigitalwillgetResponse({this.assets});

  DigitalwillgetResponse.fromJson(Map<String, dynamic> json) {
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (assets != null) {
      data['assets'] = assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  int? assetId;
  int? categoryId;
  String? assetName;
  String? assetIdentity;
  List<Nominees>? nominees;

  Assets(
      {this.assetId,
        this.categoryId,
        this.assetName,
        this.assetIdentity,
        this.nominees});

  Assets.fromJson(Map<String, dynamic> json) {
    assetId = json['assetId'];
    categoryId = json['categoryId'];
    assetName = json['assetName'];
    assetIdentity = json['assetIdentity'];
    if (json['nominees'] != null) {
      nominees = <Nominees>[];
      json['nominees'].forEach((v) {
        nominees!.add(Nominees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetId'] = assetId;
    data['categoryId'] = categoryId;
    data['assetName'] = assetName;
    data['assetIdentity'] = assetIdentity;
    if (nominees != null) {
      data['nominees'] = nominees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nominees {
  int? id;
  String? name;
  String? mobile;
  String? relation;
  double? share;

  Nominees({this.id, this.name, this.mobile, this.relation, this.share});

  Nominees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    relation = json['relation'];
    share = json['share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['relation'] = relation;
    data['share'] = share;
    return data;
  }
}
