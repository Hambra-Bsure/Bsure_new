class NpsResponse {
  Asset? asset;
  bool? success;
  String? message;

  NpsResponse({this.asset, this.success, this.message});

  NpsResponse.fromJson(Map<String, dynamic> json) {
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
  Null? loanGiven;

  Asset({this.id, this.userId, this.category, this.loanGiven});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    loanGiven = json['LoanGiven'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['category'] = this.category;
    data['LoanGiven'] = this.loanGiven;
    return data;
  }
}
