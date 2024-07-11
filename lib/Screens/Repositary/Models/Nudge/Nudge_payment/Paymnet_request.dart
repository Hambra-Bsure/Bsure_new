class razorpay_request {
  int? planId;

  razorpay_request({this.planId});

  razorpay_request.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planId'] = this.planId;
    return data;
  }
}