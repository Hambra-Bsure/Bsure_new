class digitalverifyotprequest {
  int? otp;

  digitalverifyotprequest({this.otp});

  digitalverifyotprequest.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    return data;
  }
}
