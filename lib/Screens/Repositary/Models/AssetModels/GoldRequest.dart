class GoldRequest {
  String? assetType;
  String? metalType;
  String? type;
  int? weightInGrams;
  String? whereItIsKept;
  String? comments;
  String? attachment;

  GoldRequest(
      {this.assetType,
        this.metalType,
        this.type,
        this.weightInGrams,
        this.whereItIsKept,
        this.comments,
        this.attachment});

  GoldRequest.fromJson(Map<String, dynamic> json) {
    assetType = json['assetType'];
    metalType = json['metalType'].cast<String>();
    type = json['type'].cast<String>();
    weightInGrams = json['weightInGrams'];
    whereItIsKept = json['whereItIsKept'];
    comments = json['comments'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetType'] = assetType;
    data['metalType'] = metalType;
    data['type'] = type;
    data['weightInGrams'] = weightInGrams;
    data['whereItIsKept'] = whereItIsKept;
    data['comments'] = comments;
    data['attachment'] = attachment;
    return data;
  }
}
