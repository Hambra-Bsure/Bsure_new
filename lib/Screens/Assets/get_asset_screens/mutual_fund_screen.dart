import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/mutual_fund.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Mutual_Fund_Edit.dart';
import '../post_asset_addition/MutualFund.dart';

class MutualFundScreen extends StatefulWidget {
  final String assetType;

  const MutualFundScreen({super.key, required this.assetType});

  @override
  _MutualFundScreenState createState() => _MutualFundScreenState();
}

class _MutualFundScreenState extends State<MutualFundScreen> {
  List<MutualFund> mutualFunds = [];
  bool isLoading = false;

  // Define a variable to hold the category name
  final String category = 'MutualFund';

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
    var token = prefs.getString("token");

    final url = Uri.parse('http://43.205.12.154:8080/v2/asset/category/MutualFund');
    final response = await http.get(url, headers: {
      "Authorization": token ?? '',
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = MutualFundResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          mutualFunds = List.from(data.assets); // Ensure a mutable copy
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
          content: Text('Failed to fetch MutualFunds'),
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
        title: const Text('Mutual Fund', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : mutualFunds.isEmpty
          ? const Center(
        child: Text("No assets found",
          style: TextStyle(fontSize: 20.0),
        ),
      )
          : ListView.builder(
        itemCount: mutualFunds.length,
        itemBuilder: (context, index) {
          final fund = mutualFunds[index];
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
                        icon: const Icon(Icons.edit, color: Color(0xff429bb8)),
                        onPressed: () async {
                          final updatedFund = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MutualFundEdit(
                                fund: fund,
                                assetType: widget.assetType,
                              ),
                            ),
                          );
                          if (updatedFund != null) {
                            setState(() {
                              // Update the corresponding Mutual Fund item in the list
                              final index = mutualFunds.indexWhere(
                                      (element) =>
                                  element.assetId ==
                                      updatedFund.assetId);
                              if (index != -1) {
                                mutualFunds[index] = updatedFund;
                              }
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  buildInfoRow('Amc name:', fund.amcName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Scheme name:', fund.schemeName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Folio number:', fund.folioNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Fund type:', fund.fundType),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Comments:', fund.comments),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Attachment:', fund.attachment),
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
                                  await deleteAssetStatus(index);
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
              builder: (context) => MutualFundAdd(assetType: category),
            ),
          );
        },
        label: const Text(
          'Add New',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        icon: const Icon(Icons.add, size: 24, color: Colors.white),
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
    final mutualFund = mutualFunds[index];
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
        DisplayUtils.showToast("MutualFund successfully deleted");
        setState(() {
          mutualFunds = List.from(mutualFunds)
            ..removeAt(index); // Create a mutable copy and update it
        });
      }
    } catch (e) {
      // Handle error
    }
  }
}
