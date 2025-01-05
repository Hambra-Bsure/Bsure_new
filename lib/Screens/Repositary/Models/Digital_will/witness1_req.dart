class Witness1Req {
  String? firstName;
  String? lastName;
  String? mobile;
  String? fatherName;
  bool? isAbove18;

  Witness1Req(
      {this.firstName,
        this.lastName,
        this.mobile,
        this.fatherName,
        this.isAbove18});

  Witness1Req.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    fatherName = json['fatherName'];
    isAbove18 = json['isAbove18'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['fatherName'] = this.fatherName;
    data['isAbove18'] = this.isAbove18;
    return data;
  }
}
