class VerifyRequest {
  int? otp;
  int? userId;

  VerifyRequest({this.otp, this.userId});

  VerifyRequest.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['userId'] = userId;
    return data;
  }
}
