import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/post_office_account_screen.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/ppf_screen.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/real_estate_screen.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/category_response.dart';
import 'Pf_screen.dart';
import 'bond_screen.dart';
import 'crypto_exchange_screen.dart';
import 'esop_screen.dart';
import 'gold_screen.dart';
import 'life_insurance_screen.dart';
import 'bank_account_screen.dart';
import 'loan_given_screen.dart';
import 'mutual_fund_screen.dart';
import 'non_life_insurance_screen.dart';
import 'nps_screen.dart';
import 'other_screen.dart';
import 'stock_broker_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    //Dio dio = HeadersUtils.getHeaders(token);

    final url = Uri.parse('http://43.205.12.154:8080/v2/asset/categories');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = CategoryResponse.fromJson(jsonDecode(response.body));
      setState(() {
        categories = data.categories;
      });
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Categories', style: TextStyle(color: Colors.white)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the appropriate screen based on the category
              if (category.name == 'BankAccount') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BankAccountsScreen(assetType: category.toString())),
                );
              } else if (category.name == 'MutualFund') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MutualFundScreen(assetType: category.toString())),
                );
              } else if (category.name == 'StockBroker') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StockBrokerScreen(assetType: category.toString())),
                );
              } else if (category.name == 'LifeInsurance') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LifeInsuranceScreen(assetType: category.toString())),
                );
              } else if (category.name == 'NonLifeInsurance') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NonLifeInsuranceScreen(
                          assetType: category.toString())),
                );
              } else if (category.name == 'PostOfficeAccount') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostofficeAccountScreen(
                          assetType: category.toString())),
                );
              } else if (category.name == 'CryptoExchange') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoExchangeScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Nps') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NpsScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Ppf') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PPfScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Pf') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PfScreen(assetType: category.toString())),
                );
              } else if (category.name == 'RealEstate') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RealEstateScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Other') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtherScreen(
                            assetType: category.toString(),
                          )),
                );
              } else if (category.name == 'LoanGiven') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoanGivenScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Vehicle') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VehicleScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Gold') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GoldScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Bond') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BondScreen(assetType: category.toString())),
                );
              } else if (category.name == 'Esop') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EsopScreen(assetType: category.toString())),
                );
              }
            },
            child: Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    category.image,
                    height: 50.0,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    convertPascalCaseToWords(category.name),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

String convertPascalCaseToWords(String input) {
  final words = RegExp('[A-Z]?[a-z]+')
      .allMatches(input)
      .map((match) => match.group(0))
      .toList();
  return words.join(' ');
}
