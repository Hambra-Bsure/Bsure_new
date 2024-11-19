import 'dart:convert';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../LoginScreen.dart';
import '../../../Repositary/Models/Digital_will/Subscriptions/Will_products.dart';
import 'Will_plans.dart';

class WillProductsScreen extends StatefulWidget {
  const WillProductsScreen({Key? key}) : super(key: key);

  @override
  _WillProductsScreenState createState() => _WillProductsScreenState();
}

class _WillProductsScreenState extends State<WillProductsScreen> {
  Future<DigitalwillProducts>? _futureProducts;
  String? _selectedProductLabel;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<DigitalwillProducts> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");

    if (token == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    final response = await http.get(
      Uri.parse('https://dev.bsure.live/v2/subscription/products'),
    );

    if (response.statusCode == 200) {
      return DigitalwillProducts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.white,
      appBar: AppBar(
        title: const Text('Digital Will Products', style: TextStyle(color: Colors.white)),
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
                      _selectedProductLabel = product.label;
                    });
                    print("Selected product label: ${product.label}");
                  },
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(8.0),
                    // color: _selectedProductLabel == product.label
                    //     ? Colors.blue.withOpacity(0.1)
                    //     : null,
                    child:ListTile(
                      title: Text(
                        product.name ?? 'N/A',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Radio<String>(
                        value: product.label!,
                        groupValue: _selectedProductLabel,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedProductLabel = value;
                          });
                          print("Radio selected product label: $value");
                        },
                      ),
                      // Remove or set isThreeLine to false
                      isThreeLine: false,
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
          onPressed: _selectedProductLabel == null
              ? null
              : () {
          //  print("Button pressed with selected product label: $_selectedProductLabel");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WillPlansScreen()),
            );
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
