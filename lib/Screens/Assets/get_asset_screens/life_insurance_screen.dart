import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/Update_asset_screens/LifeInsurance_Edit.dart';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/LifeInsurance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/get_asset_models/life_Insurance.dart';
import '../../Utils/DisplayUtils.dart';

class LifeInsuranceScreen extends StatefulWidget {
  final String assetType;

  const LifeInsuranceScreen({super.key, required this.assetType});

  @override
  _LifeInsuranceScreenState createState() => _LifeInsuranceScreenState();
}

class _LifeInsuranceScreenState extends State<LifeInsuranceScreen> {
  List<LifeInsurance> lifeInsurances = [];
  bool isLoading = false;

  final String category = 'LifeInsurance';

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

    final url =
        Uri.parse('http://43.205.12.154:8080/v2/asset/category/LifeInsurance');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = LifeInsuranceResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          lifeInsurances = data.assets;
          isLoading = false;
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
          content: Text('Failed to fetch life insurance details'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Life Insurance', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: Text("No Assets found"))
          : lifeInsurances.isNotEmpty == true
              ? ListView.builder(
                  itemCount: lifeInsurances.length,
                  itemBuilder: (context, index) {
                    final insurance = lifeInsurances[index];
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
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    final updatedInsurance =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LifeInsuranceEdit(
                                          insurance: insurance,
                                          assetType: category,
                                        ),
                                      ),
                                    );
                                    if (updatedInsurance != null) {
                                      setState(() {
                                        lifeInsurances[index] =
                                            updatedInsurance;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text(
                                'insuranceCompanyName: ${insurance.insuranceCompanyName}'),
                            const SizedBox(height: 8.0),
                            Text('policyName: ${insurance.policyName}'),
                            const SizedBox(height: 8.0),
                            Text('policyNumber: ${insurance.policyNumber}'),
                            const SizedBox(height: 8.0),
                            Text('coverageAmount: ${insurance.coverageAmount}'),
                            const SizedBox(height: 8.0),
                            Text('maturityDate: ${insurance.maturityDate}'),
                            const SizedBox(height: 8.0),
                            Text('comments: ${insurance.comments}'),
                            const SizedBox(height: 8.0),
                            Text('attachment: ${insurance.attachment}'),
                            const SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete Asset?"),
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
                                            List<LifeInsurance>
                                                newlifeInsurances =
                                                <LifeInsurance>[];
                                            newlifeInsurances
                                                .addAll(lifeInsurances);
                                            newlifeInsurances.removeAt(index);
                                            setState(() {
                                              lifeInsurances =
                                                  newlifeInsurances;
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
                )
              : const Center(
                  child: Text(
                    'No data found',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LifeInsuranceAdd(
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

  Future<void> deleteAssetStatus(int index) async {
    final mutualFund = lifeInsurances[index];
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      // Handle token absence or expiration here
      return;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.delete(
        'http://43.205.12.154:8080/v2/asset/${mutualFund.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("life insurance successfully deleted.");

      }
    } catch (e) {}
  }
}
