class MutualFund {
  final String name;

  MutualFund({required this.name});

  factory MutualFund.fromJson(Map<String, dynamic> json) {
    return MutualFund(
      name: json['AMC Name'] as String, // Adjust this based on your actual JSON field
    );
  }
}
