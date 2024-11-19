
class Witness1Req {
  late String firstName;
  late String lastName;
  late String mobile;
  late String? address;
  late String fatherName;
  int? age;
  String? emailId;


  Witness1Req({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.address,
    required this.fatherName,
    this.age,
    this.emailId,
  });

  Witness1Req.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    address = json['address'];
    fatherName = json['fatherName'];
    age = json['age'];
    emailId = json['emailId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['address'] = address;
    data['fatherName'] = fatherName;
    data['age'] = age;
    data['emailId'] = emailId;
    return data;
  }
}
