class WillExecutorReq {
  String? firstName;
  String? lastName;
  String? mobile;
  String? fatherName;
  String? address;
  int? age;
  String? religion;
  String? gender;

  WillExecutorReq(
      {this.firstName,
      this.lastName,
      this.mobile,
      this.fatherName,
      this.address,
      this.age,
      this.religion,
      this.gender});

  WillExecutorReq.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    fatherName = json['fatherName'];
    address = json['address'];
    age = json['age'];
    religion = json['religion'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['fatherName'] = this.fatherName;
    data['address'] = this.address;
    data['age'] = this.age;
    data['religion'] = this.religion;
    data['gender'] = this.gender;
    return data;
  }
}
