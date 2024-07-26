class ExecutorResponse {
  bool? success;
  String? message;
  Executor? executor;

  ExecutorResponse({this.success, this.message, this.executor});

  ExecutorResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    executor = json['executor'] != null
        ? new Executor.fromJson(json['executor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.executor != null) {
      data['executor'] = this.executor!.toJson();
    }
    return data;
  }
}

class Executor {
  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? mobile;
  int? age;
  String? religion;
  int? willId;

  Executor(
      {this.id,
        this.firstName,
        this.lastName,
        this.fatherName,
        this.mobile,
        this.age,
        this.religion,
        this.willId});

  Executor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fatherName = json['fatherName'];
    mobile = json['mobile'];
    age = json['age'];
    religion = json['religion'];
    willId = json['willId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fatherName'] = this.fatherName;
    data['mobile'] = this.mobile;
    data['age'] = this.age;
    data['religion'] = this.religion;
    data['willId'] = this.willId;
    return data;
  }
}
