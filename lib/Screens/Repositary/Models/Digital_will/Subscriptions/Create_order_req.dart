class CreateOrderReq {
  int? planId;

  CreateOrderReq({this.planId});

  CreateOrderReq.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planId'] = this.planId;
    return data;
  }
}
