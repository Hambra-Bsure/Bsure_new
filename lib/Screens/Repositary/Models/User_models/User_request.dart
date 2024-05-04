class UserRequest {
  late String firstName;
  late String lastName;
  late String whatsappNumber;
  late int age;
  late String gender;

  String? email;
  String? secondaryNumber;
  String? address;
  String? panNumber;
  String? photo;

  UserRequest({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.whatsappNumber,
    this.email,
    this.secondaryNumber,
    this.address,
    this.panNumber,
    this.photo,
  });

  UserRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'] ?? ''; // Initialize with empty string if null
    lastName = json['lastName'] ?? ''; // Initialize with empty string if null
    email = json['email'];
    whatsappNumber = json['whatsappNumber'] ?? ''; // Initialize with empty string if null
    secondaryNumber = json['secondaryNumber'];
    address = json['address'];
    panNumber = json['panNumber'];
    age = json['age'] ?? 0; // Initialize with 0 if null
    gender = json['gender'] ?? ''; // Initialize with empty string if null
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'whatsappNumber': whatsappNumber,
      'age': age,
      'gender': gender,
    };

    if (email != null && email!.isNotEmpty) data['email'] = email;
    if (secondaryNumber != null && secondaryNumber!.isNotEmpty) {
      data['secondaryNumber'] = secondaryNumber;
    }
    if (address != null && address!.isNotEmpty) data['address'] = address;
    if (panNumber != null && panNumber!.isNotEmpty) data['panNumber'] = panNumber;
    if (photo != null && photo!.isNotEmpty) data['photo'] = photo;

    return data;
  }
}
