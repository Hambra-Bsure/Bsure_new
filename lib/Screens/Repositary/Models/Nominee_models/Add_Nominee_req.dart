class AddNomineeRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? address;
  String? relation;
  int? age;
  String? image;
  String? idProof;
  String? guardianName;
  String? guardianMobileNumber;

  AddNomineeRequest(
      {this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.address,
        this.relation,
        this.age,
        this.image,
        this.idProof,
        this.guardianName,
        this.guardianMobileNumber});

  AddNomineeRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    relation = json['relation'];
    age = json['age'];
    image = json['image'];
    idProof = json['idProof'];
    guardianName = json['guardianName'];
    guardianMobileNumber = json['guardianMobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['address'] = this.address;
    data['relation'] = this.relation;
    data['age'] = this.age;
    data['image'] = this.image;
    data['idProof'] = this.idProof;
    data['guardianName'] = this.guardianName;
    data['guardianMobileNumber'] = this.guardianMobileNumber;
    return data;
  }
}
