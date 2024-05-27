class Witness1Res {
  bool? success;
  String? message;
  List<Witness>? witness;

  Witness1Res({this.success, this.message, this.witness});

  Witness1Res.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['witness'] != null) {
      witness = <Witness>[];
      json['witness'].forEach((v) {
        witness!.add(new Witness.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.witness != null) {
      data['witness'] = this.witness!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Witness {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? address;
  bool? verified;
  int? otp;
  String? otpExpiry;
  int? willId;

  Witness({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.address,
    this.verified,
    this.otp,
    this.otpExpiry,
    this.willId,
  });

  Witness.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?; // Assigning as int? (nullable int) to handle potential null value
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    address = json['address'];
    verified = json['verified'];
    otp = json['otp'];
    otpExpiry = json['otp_expiry'];
    willId = json['willId'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['address'] = address;
    data['verified'] = verified;
    data['otp'] = otp;
    data['otp_expiry'] = otpExpiry;
    data['willId'] = willId;
    return data;
  }
}
