class EditNomineeRes {
  bool? success;
  String? message;
  Nominee? nominee;

  EditNomineeRes({this.success, this.message, this.nominee});

  EditNomineeRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    nominee =
    json['nominee'] != null ? new Nominee.fromJson(json['nominee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.nominee != null) {
      data['nominee'] = this.nominee!.toJson();
    }
    return data;
  }
}

class Nominee {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? address;
  String? relation;
  int? age;
  Null? image;
  Null? idProof;
  Null? guardianName;
  Null? guardianMobileNumber;
  String? createdAt;
  String? updatedAt;
  int? userId;

  Nominee(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.email,
        this.address,
        this.relation,
        this.age,
        this.image,
        this.idProof,
        this.guardianName,
        this.guardianMobileNumber,
        this.createdAt,
        this.updatedAt,
        this.userId});

  Nominee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    address = json['address'];
    relation = json['relation'];
    age = json['age'];
    image = json['image'];
    idProof = json['idProof'];
    guardianName = json['guardianName'];
    guardianMobileNumber = json['guardianMobileNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    data['address'] = this.address;
    data['relation'] = this.relation;
    data['age'] = this.age;
    data['image'] = this.image;
    data['idProof'] = this.idProof;
    data['guardianName'] = this.guardianName;
    data['guardianMobileNumber'] = this.guardianMobileNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    return data;
  }
}