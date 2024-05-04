
class UserResponse {
  bool? success;
  User? user;

  UserResponse({this.success, this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? whatsappNumber;
  String? secondaryNumber;
  String? address;
  String? panNumber;
  int? age;
  String? gender;
  String? photo;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.whatsappNumber,
        this.secondaryNumber,
        this.address,
        this.panNumber,
        this.age,
        this.gender,
        this.photo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    whatsappNumber = json['whatsappNumber'];
    secondaryNumber = json['secondaryNumber'];
    address = json['address'];
    panNumber = json['panNumber'];
    age = json['age'];
    gender = json['gender'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['whatsappNumber'] = whatsappNumber;
    data['secondaryNumber'] = secondaryNumber;
    data['address'] = address;
    data['panNumber'] = panNumber;
    data['age'] = age;
    data['gender'] = gender;
    data['photo'] = photo;
    return data;
  }
}
