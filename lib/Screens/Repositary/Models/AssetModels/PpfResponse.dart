class PpfResponse {
  Asset? asset;
  bool? success;
  String? message;

  PpfResponse({this.asset, this.success, this.message});

  PpfResponse.fromJson(Map<String, dynamic> json) {
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
  Null loanGiven;

  Asset({this.id, this.userId, this.category, this.loanGiven});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    category = json['category'];
    loanGiven = json['LoanGiven'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['category'] = category;
    data['LoanGiven'] = loanGiven;
    return data;
  }
}
