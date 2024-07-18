class WillExecutorRes {
  bool? success;
  Executor? executor;
  String? message;  // Add this line to include the message field

  WillExecutorRes({this.success, this.executor, this.message});

  WillExecutorRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    executor = json['executor'] != null
        ? Executor.fromJson(json['executor'])
        : null;
    message = json['message'];  // Add this line to parse the message field
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (executor != null) {
      data['executor'] = executor!.toJson();
    }
    data['message'] = message;  // Add this line to include the message field
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

  Executor({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.mobile,
    this.age,
    this.religion,
    this.willId,
  });

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fatherName'] = fatherName;
    data['mobile'] = mobile;
    data['age'] = age;
    data['religion'] = religion;
    data['willId'] = willId;
    return data;
  }
}
