import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/Esop.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/get_asset_models/esop.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Esop_Edit.dart';

class EsopScreen extends StatefulWidget {
  final String assetType;

  const EsopScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _EsopScreenState createState() => _EsopScreenState();
}

class _EsopScreenState extends State<EsopScreen> {
  List<Esop> esop = []; // Renamed to plural 'vehicles'
  bool isLoading = false;

  final String category = 'Esop';

  @override
  void initState() {
    super.initState();
    getData(); // Renamed method to fetchVehicles
  }

  Future<void> getData() async {
    // Renamed method to fetchVehicles
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    final url = Uri.parse('http://43.205.12.154:8080/v2/asset/category/Esop');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = EsopResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          esop = data.assets;
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
          content: Text('Failed to fetch Esop details'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff429bb8),
        title: const Text('Esop', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: Text("No Assets found"))
          : esop.isNotEmpty == true
              ? ListView.builder(
                  itemCount: esop.length,
                  itemBuilder: (context, index) {
                    final esops = esop[index];
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
                                    final updatedesop = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EsopEdit(
                                          esop: esops,
                                          assetType: category,
                                        ),
                                      ),
                                    );
                                    if (updatedesop != null) {
                                      setState(() {
                                        esop[index] = updatedesop;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text('companyName: ${esops.companyName}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'Number of Stocks: ${esops.numberOfStocks ?? 'N/A'}'),
                            const SizedBox(height: 8.0),
                            Text('optionPrice: ${esops.optionPrice}'),
                            const SizedBox(height: 8.0),
                            Text('expiryDate: ${esops.expiryDate}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'totalSharesAvailableForIssue: ${esops.totalSharesAvailableForIssue ?? 'N/A'}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'issuePricePerShare: ${esops.issuePricePerShare}'),
                            const SizedBox(height: 8.0),
                            Text('comments: ${esops.comments}'),
                            const SizedBox(height: 8.0),
                            Text('attachment: ${esops.attachment}'),
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
                                            List<Esop> newesop = <Esop>[];
                                            newesop.addAll(esop);
                                            newesop.removeAt(index);
                                            setState(() {
                                              esop = newesop;
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
              builder: (context) => EsopAdd(
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
    final Esop = esop[index];
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
        'http://43.205.12.154:8080/v2/asset/${Esop.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast(" esop successfully deleted.");
      }
    } catch (e) {}
  }
}
