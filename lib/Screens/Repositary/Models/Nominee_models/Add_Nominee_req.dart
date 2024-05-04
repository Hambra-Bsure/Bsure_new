class AddNomineeRequest {
  late String firstName;
  late String lastName;
  late String address;
  late String relation;
  late int age;

  String? mobileNumber;
  String? email;
  String? image;
  String? idProof;
  String? guardianName;
  String? guardianMobileNumber;

  AddNomineeRequest({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.relation,
    required this.age,
    this.email,
    this.mobileNumber,
    this.image,
    this.idProof,
    this.guardianName,
    this.guardianMobileNumber,
  });

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

    // Check if 'guardianName' exists in the JSON and if it's not null
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
