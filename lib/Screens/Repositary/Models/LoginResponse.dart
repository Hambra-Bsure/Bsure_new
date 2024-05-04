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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['newUser'] = this.newUser;
    data['userId'] = this.userId;
    return data;
  }
}
