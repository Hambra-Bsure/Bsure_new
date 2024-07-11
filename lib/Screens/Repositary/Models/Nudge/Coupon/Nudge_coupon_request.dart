class UserDiscountRequest {
  int? userId;
  String? code;
  int? planAmount;

  UserDiscountRequest({this.userId, this.code, this.planAmount});

  UserDiscountRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    code = json['code'];
    planAmount = json['planAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['code'] = code;
    data['planAmount'] = planAmount;
    return data;
  }
}