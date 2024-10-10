class LifeInsurance {
  final String name;

  LifeInsurance({required this.name});

  factory LifeInsurance.fromJson(Map<String, dynamic> json) {
    return LifeInsurance(
      name: json['Insurance company name'] as String, // Adjust this based on your actual JSON field
    );
  }
}
