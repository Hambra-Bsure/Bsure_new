class VerifyResponse {
  User? user;
  String? token;

  VerifyResponse({this.user, this.token});

  VerifyResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
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
