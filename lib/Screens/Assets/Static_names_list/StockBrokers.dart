class Broker {
  final String name;

  Broker({required this.name});

  factory Broker.fromJson(Map<String, dynamic> json) {
    return Broker(
      name: json['Broker Name'] as String, // Adjust this based on your actual JSON field
    );
  }
}
