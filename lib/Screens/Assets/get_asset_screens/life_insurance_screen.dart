import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/Update_asset_screens/LifeInsurance_Edit.dart';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/LifeInsurance.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/get_asset_models/category_response.dart';
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
        Uri.parse('https://dev.bsure.live/v2/asset/category/LifeInsurance');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = LifeInsuranceResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          lifeInsurances = data.assets;
        });
      } else {
        showSnackBar(context, data.message);
      }
    } else {
      showSnackBar(context, 'Failed to fetch life insurance details');
    }

    setState(() {
      isLoading = false;
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("Asset Type: ${widget.assetType}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Life insurance', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : lifeInsurances.isEmpty
              ? const Center(
                  child: Text("No assets found",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              : ListView.builder(
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
                                  icon: const Icon(Icons.edit,
                                      color: Color(0xff429bb8)),
                                  onPressed: () async {
                                    final updatedInsurance =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LifeInsuranceEdit(
                                          insurance: insurance,
                                          assetType: widget.assetType,
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
                            buildInfoRow('Insurance company name',
                                insurance.insuranceCompanyName),
                            const SizedBox(height: 8.0),
                            buildInfoRow('Policy name', insurance.policyName),
                            const SizedBox(height: 8.0),
                            buildInfoRow(
                                'Policy number', insurance.policyNumber),
                            const SizedBox(height: 4.0),
                            if (insurance.coverageAmount != null &&
                                insurance.coverageAmount != 0)
                              buildInfoRow('Coverage amount',
                                  insurance.coverageAmount.toString()),
                            const SizedBox(height: 8.0),
                            buildInfoRow(
                                'Maturity aate', insurance.maturityDate),
                            const SizedBox(height: 4.0),
                            buildInfoRow('Comments', insurance.comments),
                            const SizedBox(height: 8.0),
                            buildInfoRow('Attachment', insurance.attachment),
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
                                            List<LifeInsurance>
                                                newLifeInsurances =
                                                <LifeInsurance>[];
                                            newLifeInsurances
                                                .addAll(lifeInsurances);
                                            newLifeInsurances.removeAt(index);
                                            setState(() {
                                              lifeInsurances =
                                                  newLifeInsurances;
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
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 7,
            child: Text(
              value ?? '',
              overflow: TextOverflow.ellipsis,
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
    final insurance = lifeInsurances[index];
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
        'https://dev.bsure.live/v2/asset/${insurance.assetId}',
      );

      if (response.statusCode == 200) {
        setState(() {
          lifeInsurances.removeAt(index);
        });
        DisplayUtils.showToast("Life insurance successfully deleted");
      }
    } catch (e) {
      DisplayUtils.showToast("Failed to delete life insurance");
    }
  }
}
