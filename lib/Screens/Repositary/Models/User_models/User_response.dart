
class UserResponse {
  bool? success;
  User? user;

  UserResponse({this.success, this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['whatsappNumber'] = this.whatsappNumber;
    data['secondaryNumber'] = this.secondaryNumber;
    data['address'] = this.address;
    data['panNumber'] = this.panNumber;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['photo'] = this.photo;
    return data;
  }
}
