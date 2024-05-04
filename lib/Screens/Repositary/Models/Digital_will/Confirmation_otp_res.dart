class confirmationotpresponse {
  bool? isValid;
  String? message;

  confirmationotpresponse({this.isValid, this.message});

  confirmationotpresponse.fromJson(Map<String, dynamic> json) {
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
