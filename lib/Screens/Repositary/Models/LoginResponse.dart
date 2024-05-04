class LoginResponse2 {
  String? message;
  bool? success;
  bool? newUser;
  int? userId;

  LoginResponse2({this.message, this.success, this.newUser, this.userId});

  LoginResponse2.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    newUser = json['newUser'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['newUser'] = newUser;
    data['userId'] = userId;
    return data;
  }
}
