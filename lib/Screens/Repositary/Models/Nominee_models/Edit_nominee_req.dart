class EditNomineeReq {
  int? nomineeId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? address;
  String? relation;
  int? age;

  EditNomineeReq(
      {this.nomineeId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.address,
        this.relation,
        this.age});

  EditNomineeReq.fromJson(Map<String, dynamic> json) {
    nomineeId = json['nomineeId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    relation = json['relation'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomineeId'] = this.nomineeId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['address'] = this.address;
    data['relation'] = this.relation;
    data['age'] = this.age;
    return data;
  }
}
