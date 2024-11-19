class Bank {
  final String name;

  Bank({required this.name});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      name: json['bankName'] as String, // Adjust this based on your actual JSON field
    );
  }
}
