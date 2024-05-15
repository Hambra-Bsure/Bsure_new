class EditNomineeReq {
  int? nomineeId;
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

  EditNomineeReq(
      {this.nomineeId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.address,
        this.relation,
        this.image,
        this.idProof,
        this.guardianName,
        this.guardianMobileNumber,
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

    if (json.containsKey('guardianName') && json['guardianName'] != null) {
      guardianName = json['guardianName']; // Assign the value if it's not null
    } else {
      guardianName = null; // Assign null if the value is null or not present
    }

    // Similar handling for 'guardianMobileNumber'
    if (json.containsKey('guardianMobileNumber') &&
        json['guardianMobileNumber'] != null) {
      guardianMobileNumber = json['guardianMobileNumber'];
    } else {
      guardianMobileNumber = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomineeId'] = nomineeId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['address'] = address;
    data['relation'] = relation;
    data['age'] = age;

    if (email != null && email != "") data['email'] = email;
    if (mobileNumber != null && mobileNumber != "") {
      data['mobileNumber'] = mobileNumber;
    }
    if (image != null && image != "") data['image'] = image;
    if (idProof != null && idProof != "") data['idProof'] = idProof;
    if (guardianName != null && guardianName != "") {
      data['guardianName'] = guardianName;
    }
    if (guardianMobileNumber != null && guardianMobileNumber != "") {
      data['guardianMobileNumber'] = guardianMobileNumber;
    }

    return data;
  }
}
