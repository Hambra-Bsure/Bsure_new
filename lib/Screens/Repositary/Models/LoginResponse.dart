class LoginResponse2 {
  String? message;
  bool? success;
  bool? newUser;
  User? user;

  LoginResponse2({this.message, this.success, this.newUser, this.user});

  LoginResponse2.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    newUser = json['newUser'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['newUser'] = newUser;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? userEmail;
  String? userMobile;

  User({this.userId, this.userEmail, this.userMobile});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userEmail = json['userEmail'];
    userMobile = json['userMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userEmail'] = userEmail;
    data['userMobile'] = userMobile;
    return data;
  }
}
