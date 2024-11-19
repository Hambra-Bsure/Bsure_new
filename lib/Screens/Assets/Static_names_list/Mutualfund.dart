class Fund {
  final String name;

  Fund({required this.name});

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      name: json['AMC Name'] as String, // Adjust this based on your actual JSON field
    );
  }
}
