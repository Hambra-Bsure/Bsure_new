import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/Update_asset_screens/Nonlifeinsurance_Edit.dart';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/Non-LifeInsurance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/non_life_insurance.dart';
import '../../Utils/DisplayUtils.dart';

class NonLifeInsuranceScreen extends StatefulWidget {
  final String assetType;

  const NonLifeInsuranceScreen({super.key, required this.assetType});

  @override
  _NonLifeInsuranceScreenState createState() => _NonLifeInsuranceScreenState();
}

class _NonLifeInsuranceScreenState extends State<NonLifeInsuranceScreen> {
  List<NonLifeInsurance> nonlifeInsurances = [];
  bool isLoading = false;

  final String category = 'NonLifeInsurance';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    if (token == null ) {
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
      return;
    }

    final url = Uri.parse(
        'https://dev.bsure.live/v2/asset/category/NonLifeInsurance');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = NonLifeInsuranceResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          nonlifeInsurances = data.assets;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data.message),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch non life insurance details'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Non-Life insurance',
            style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : nonlifeInsurances.isEmpty
          ? const Center(
        child: Text("No assets found",
          style: TextStyle(fontSize: 20.0),
        ),
      )
          : ListView.builder(
        itemCount: nonlifeInsurances.length,
        itemBuilder: (context, index) {
          final nonlifeinsurance = nonlifeInsurances[index];
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: Color(0xff429bb8)),
                        onPressed: () async {
                          final updatednonlifeinsurance =
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NonLifeInsuranceEdit(
                                    nonlifeinsurance: nonlifeinsurance,
                                    assetType: category,
                                  ),
                            ),
                          );
                          if (updatednonlifeinsurance != null) {
                            setState(() {
                              nonlifeInsurances[index] =
                                  updatednonlifeinsurance;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  buildInfoRow('Insurance company name:',
                      nonlifeinsurance.insuranceCompanyName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Type of insurance:',
                      nonlifeinsurance.typeOfInsurance),
                  const SizedBox(height: 8.0),
                  buildInfoRow(
                      'Policy name:', nonlifeinsurance.policyName),
                  const SizedBox(height: 8.0),
                  buildInfoRow(
                      'Policy number:', nonlifeinsurance.policyNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow(
                      'Comments:', nonlifeinsurance.comments),
                  const SizedBox(height: 8.0),
                  buildInfoRow(
                      'Attachment:', nonlifeinsurance.attachment),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete asset?"),
                            content: const Text(
                                "Are you sure you want to delete this Asset?"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Color(0xff429bb8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  deleteAssetStatus(index);
                                  List<NonLifeInsurance>
                                  newnonlifeinsurance =
                                  <NonLifeInsurance>[];
                                  newnonlifeinsurance
                                      .addAll(nonlifeInsurances);
                                  newnonlifeinsurance.removeAt(index);
                                  setState(() {
                                    nonlifeInsurances =
                                        newnonlifeinsurance;
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: const Color(0xff429bb8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Colors.white),
                        SizedBox(width: 5),
                        Text("Delete",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NonLifeInsuranceAdd(
                assetType: category,
              ),
            ),
          );
        },
        label: const Text(
          'Add New',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.add,
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff429bb8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
             // overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 7,
            child: Text(
              value ?? '',
             // overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteAssetStatus(int index) async {
    final mutualFund = nonlifeInsurances[index];
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
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
      return;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.delete(
        'https://dev.bsure.live/v2/asset/${mutualFund.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Non life insurance successfully deleted.");
      }
    } catch (e) {
      DisplayUtils.showToast("Failed to delete non life insurance.");
    }
  }
}
