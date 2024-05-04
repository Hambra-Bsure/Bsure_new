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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomineeId'] = nomineeId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['address'] = address;
    data['relation'] = relation;
    data['age'] = age;
    return data;
  }
}
