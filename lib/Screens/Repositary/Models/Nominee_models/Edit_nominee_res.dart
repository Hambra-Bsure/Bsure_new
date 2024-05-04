class EditNomineeRes {
  bool? success;
  String? message;
  Nominee? nominee;

  EditNomineeRes({this.success, this.message, this.nominee});

  EditNomineeRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    nominee =
    json['nominee'] != null ? Nominee.fromJson(json['nominee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (nominee != null) {
      data['nominee'] = nominee!.toJson();
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
  Null image;
  Null idProof;
  Null guardianName;
  Null guardianMobileNumber;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobileNumber'] = mobileNumber;
    data['email'] = email;
    data['address'] = address;
    data['relation'] = relation;
    data['age'] = age;
    data['image'] = image;
    data['idProof'] = idProof;
    data['guardianName'] = guardianName;
    data['guardianMobileNumber'] = guardianMobileNumber;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}
