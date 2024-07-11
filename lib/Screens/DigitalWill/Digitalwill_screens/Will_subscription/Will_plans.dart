import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repositary/Models/Digital_will/Subscriptions/Will_plans.dart';
import 'Will_payments.dart';
import 'package:http/http.dart' as http;

class WillPlansScreen extends StatefulWidget {
  const WillPlansScreen({Key? key}) : super(key: key);

  @override
  _WillPlansScreenState createState() => _WillPlansScreenState();
}

class _WillPlansScreenState extends State<WillPlansScreen> {
  Future<DigitalwillPlans>? _futurePlans;
  int? _selectedPlanId;
  int? _selectedPlanPrice;

  @override
  void initState() {
    super.initState();
    _futurePlans = fetchPlans();
  }

  Future<DigitalwillPlans> fetchPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");

    final response = await http.get(
      Uri.parse(
          'http://43.205.12.154:8080/v2/subscription/products/digitalWill/plans'),
    );

    if (response.statusCode == 200) {
      return DigitalwillPlans.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load plans');
    }
  }

  void navigateToPaymentScreen(int planId, int price) {
    print("Plan ID: $planId, Price: ₹$price");
    if (planId != null && price != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WillPaymentsScreen(planId: planId, price: price),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Will Plans',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
      body: FutureBuilder<DigitalwillPlans>(
        future: _futurePlans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data!.plans == null ||
              snapshot.data!.plans!.isEmpty) {
            return const Center(child: Text('No plans available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.plans!.length,
              itemBuilder: (context, index) {
                final plan = snapshot.data!.plans![index];
                final formattedPrice = (plan.price! / 100).toStringAsFixed(2);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPlanId = plan.id;
                      _selectedPlanPrice = plan.price;
                    });
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    color: _selectedPlanId == plan.id
                        ? Colors.blue.withOpacity(0.1)
                        : null,
                    child: ListTile(
                      title: Text(plan.name ?? 'N/A'),
                      subtitle: Text(
                        '${plan.label ?? ''}\nPrice: ₹${formattedPrice}\nPeriod: ${plan.period ?? ''}\nProductId: ${plan.productId ?? ''}',
                        style: const TextStyle(height: 1.5),
                      ),
                      trailing: Radio<int>(
                        value: plan.id!,
                        groupValue: _selectedPlanId,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedPlanId = value;
                            _selectedPlanPrice = plan.price ?? 0;
                          });
                        },
                      ),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _selectedPlanId == null
              ? null
              : () {
                  navigateToPaymentScreen(
                      _selectedPlanId!, _selectedPlanPrice!);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff429bb8),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text(
            'Select Plan',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}