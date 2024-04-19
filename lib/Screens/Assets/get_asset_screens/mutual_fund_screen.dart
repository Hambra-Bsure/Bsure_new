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
  final String category = 'MutualFund'; // Assuming the category is 'BankAccount'

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
        Uri.parse('http://43.205.12.154:8080/v2/asset/category/MutualFund');
    final response =
        await http.get(url, headers: {"Authorization": token.toString(),"ngrok-skip-browser-warning": "69420",});

    if (response.statusCode == 200) {
      final data = MutualFundResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          mutualFunds = data.assets;
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
          : mutualFunds.isNotEmpty == true
              ? ListView.builder(
                  itemCount: mutualFunds.length,
                  itemBuilder: (context, index) {
                    final fund = mutualFunds[index];
                    return Card(
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
                                        final index = mutualFunds.indexWhere((element) => element.assetId == updatedFund.assetId);
                                        if (index != -1) {
                                          mutualFunds[index] = updatedFund;
                                        }
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text(
                              'AMC Name: ${fund.amcName}'),
                            const SizedBox(height: 8.0),
                            Text('Scheme Name: ${fund.schemeName}'),
                            const SizedBox(height: 8.0),
                            Text('Folio Number: ${fund.folioNumber}'),
                            const SizedBox(height: 8.0),
                            Text('Fund Type: ${fund.fundType}'),
                            const SizedBox(height: 8.0),
                            Text('Comments: ${fund.comments}'),
                            const SizedBox(height: 8.0),
                            Text('Attachment: ${fund.attachment}'),
                            const SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Delete Asset?"),
                                      content: const Text(
                                          "Are you sure you want to delete this Asset?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color: Color(
                                                  0xff429bb8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop();
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
                                            Navigator.of(context)
                                                .pop();
                                            deleteAssetStatus(
                                                index, context);
                                            setState(() {
                                              mutualFunds!
                                                  .removeAt(
                                                  index);
                                              getData();
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
                                  borderRadius:
                                  BorderRadius.circular(50),
                                ),
                                backgroundColor:
                                const Color(0xff429bb8),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete,
                                      color: Colors.white),
                                  SizedBox(width: 5),
                                  Text("Delete",
                                      style: TextStyle(
                                          color: Colors.white)),
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
                    'No mutual funds found',
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
              builder: (context) =>  MutualFundAdd(
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

  Future<void> deleteAssetStatus(int index, BuildContext context) async {
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
        // Remove the deleted bank account from the list
        setState(() {
          mutualFunds.removeAt(index);
          getData();
        });

        // Call getData() outside setState() to ensure immediate UI update

        DisplayUtils.showToast("Mutual Fund successfully deleted.");
      } else {
        DisplayUtils.showToast("Failed to delete Mutual Fund. ${response.data}");
      }
    } catch (e) {
      DisplayUtils.showToast("API failure");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed to delete bank account. Please check your internet connection.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
