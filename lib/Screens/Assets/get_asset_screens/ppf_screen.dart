import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:bsure_assets/config/config.dart' show base_url;
import '../../Repositary/Models/get_asset_models/Ppf.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/PPF_Edit.dart';
import '../post_asset_addition/PPF.dart';

class PPfScreen extends StatefulWidget {
  final String assetType;

  const PPfScreen({super.key, required this.assetType});

  @override
  _PPfScreenState createState() => _PPfScreenState();
}

class _PPfScreenState extends State<PPfScreen> {
  List<PPf> pps = [];
  bool isLoading = false;

  final String category = 'Ppf';

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

    final url = Uri.parse('http://43.205.12.154:8080/v2/asset/category/Ppf');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = PPfResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          pps = data.assets;
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
          content: Text('Failed to fetch PPf details'),
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
        title: const Text('PPf', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: Text("No Assets found"))
          : pps.isNotEmpty == true
              ? ListView.builder(
                  itemCount: pps.length,
                  itemBuilder: (context, index) {
                    final Ppf = pps[index];
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
                                    final updatedppf = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PpfEdit(
                                          ppf: pps[index], // Convert PPf to PPF
                                          assetType: category,
                                        ),
                                      ),
                                    );
                                    if (updatedppf != null) {
                                      setState(() {
                                        pps[index] = updatedppf;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text('ppfAccountNumber: ${Ppf.ppfAccountNumber}'),
                            const SizedBox(height: 8.0),
                            Text('institutionName: ${Ppf.institutionName}'),
                            const SizedBox(height: 8.0),
                            Text('comments: ${Ppf.comments}'),
                            const SizedBox(height: 8.0),
                            Text('attachment: ${Ppf.attachment}'),
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
                                            List<PPf> newppf = <PPf>[];
                                            newppf.addAll(pps);
                                            newppf.removeAt(index);
                                            setState(() {
                                              pps = newppf;
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
              builder: (context) => PpfAdd(
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
    final ppf = pps[index];
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
        'http://43.205.12.154:8080/v2/asset/${ppf.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("ppf successfully deleted.");
      }
    } catch (e) {}
  }
}
