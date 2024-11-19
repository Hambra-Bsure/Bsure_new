class Insurance {
  final String name;

  Insurance({required this.name});

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      name: json['Insurance company name'] as String, // Adjust this based on your actual JSON field
    );
  }
}
