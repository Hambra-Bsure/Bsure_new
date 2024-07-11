import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
    var token = prefs.getString("token");

    final url = Uri.parse('http://43.205.12.154:8080/v2/asset/category/Ppf');
    final response = await http.get(url, headers: {
      "Authorization": token ?? "",
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
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data.message),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch PPF details'),
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
        title: const Text('PPF', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pps.isEmpty
          ? const Center(
        child:Text("No assets found",
          style: TextStyle(fontSize: 20.0),
        ),
      )
          : ListView.builder(
        itemCount: pps.length,
        itemBuilder: (context, index) {
          final ppf = pps[index];
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
                        icon: const Icon(
                          Icons.edit,
                          color: Color(0xff429bb8),
                        ),
                        onPressed: () async {
                          final updatedPpf = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PpfEdit(
                                ppf: ppf,
                                assetType: category,
                              ),
                            ),
                          );
                          if (updatedPpf != null) {
                            setState(() {
                              pps[index] = updatedPpf;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  buildInfoRow('PPF account number: ', ppf.ppfAccountNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Institution name: ', ppf.institutionName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Comments: ', ppf.comments),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Attachment: ', ppf.attachment),
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
                                  List<PPf> newPpf = <PPf>[];
                                  newPpf.addAll(pps);
                                  newPpf.removeAt(index);
                                  setState(() {
                                    pps = newPpf;
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
        DisplayUtils.showToast("PPF successfully deleted.");
      }
    } catch (e) {
      // Handle the error appropriately here
    }
  }
}
