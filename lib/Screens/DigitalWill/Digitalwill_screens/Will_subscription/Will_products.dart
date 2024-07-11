import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repositary/Models/Digital_will/Subscriptions/Will_products.dart';
import 'Will_plans.dart';

class WillProductsScreen extends StatefulWidget {
  const WillProductsScreen({Key? key}) : super(key: key);

  @override
  _WillProductsScreenState createState() => _WillProductsScreenState();
}

class _WillProductsScreenState extends State<WillProductsScreen> {
  Future<DigitalwillProducts>? _futureProducts;
  int? _selectedProductId;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<DigitalwillProducts> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");

    final response = await http.get(
      Uri.parse('http://43.205.12.154:8080/v2/subscription/products'),
    );

    if (response.statusCode == 200) {
      return DigitalwillProducts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }

  void _navigateToPlans(int productId) {
    if (productId == 1) {
      // Assuming 1 is the ID for Digital Will product
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WillPlansScreen()),
      );
    } else if (productId == 2) {
      // Assuming 2 is the ID for Nudge product
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const NudgePlansScreen()),
      // );
    } else {
      // Handle other product IDs if necessary
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Will Products',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
      body: FutureBuilder<DigitalwillProducts>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data!.products == null ||
              snapshot.data!.products!.isEmpty) {
            return const Center(child: Text('No products available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.products!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data!.products![index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedProductId = product.id;
                    });
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    color: _selectedProductId == product.id
                        ? Colors.blue.withOpacity(0.1)
                        : null,
                    child: ListTile(
                      title: Text(
                        product.name ?? 'N/A',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${product.description ?? ''}\nLabel: ${product.label ?? ''}\nId: ${product.id ?? ''}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: Radio<int>(
                        value: product.id!,
                        groupValue: _selectedProductId,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedProductId = value;
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
          onPressed: _selectedProductId == null
              ? null
              : () {
                  _navigateToPlans(_selectedProductId!);
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