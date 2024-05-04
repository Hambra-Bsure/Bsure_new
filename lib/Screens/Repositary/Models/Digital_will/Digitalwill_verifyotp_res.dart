class digitalwillverifyotpresponse {
  bool? isValid;
  String? message;

  digitalwillverifyotpresponse({this.isValid, this.message});

  digitalwillverifyotpresponse.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isValid'] = isValid;
    data['message'] = message;
    return data;
  }
}
