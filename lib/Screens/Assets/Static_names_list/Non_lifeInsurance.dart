class Nonlifeinsurance {
  final String name;

  Nonlifeinsurance({required this.name});

  factory Nonlifeinsurance.fromJson(Map<String, dynamic> json) {
    return Nonlifeinsurance(
      name: json['Insurance company name'] as String, // Adjust this based on your actual JSON field
    );
  }
}
