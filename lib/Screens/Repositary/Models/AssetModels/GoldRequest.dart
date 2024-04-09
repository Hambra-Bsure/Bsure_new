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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetType'] = this.assetType;
    data['metalType'] = this.metalType;
    data['type'] = this.type;
    data['weightInGrams'] = this.weightInGrams;
    data['whereItIsKept'] = this.whereItIsKept;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    return data;
  }
}
