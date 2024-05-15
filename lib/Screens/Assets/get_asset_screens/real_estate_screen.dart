import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/real_estate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/real_estate.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/RealEstate_Edit.dart';

class RealEstateScreen extends StatefulWidget {
  final String assetType;

  const RealEstateScreen({super.key, required this.assetType});

  @override
  _RealEstateScreenState createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<RealEstateScreen> {
  List<RealEstate> realEstates = [];
  bool isLoading = false;

  final String category = 'RealEstate';

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
        Uri.parse('http://43.205.12.154:8080/v2/asset/category/RealEstate');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = RealEstateResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          realEstates = data.assets;
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
          content: Text('Failed to fetch realEstate details'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4229bb8),
        title: const Text('RealEstate', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: Text("No Assets found"))
          : realEstates.isNotEmpty
              ? ListView.builder(
                  itemCount: realEstates.length,
                  itemBuilder: (context, index) {
                    final realestate = realEstates[index];
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
                                    final updatedrealestate =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RealEstateEdit(
                                          realestate: realestate,
                                          // Pass the CryptoExchange object
                                          assetType: category,
                                        ),
                                      ),
                                    );
                                    if (updatedrealestate != null) {
                                      setState(() {
                                        realEstates[index] = updatedrealestate;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text(
                                'Type Of Property: ${realestate.typeOfProperty}'),
                            const SizedBox(height: 8.0),
                            Text('Address: ${realestate.address}'),
                            const SizedBox(height: 8.0),
                            Text('Khata Number: ${realestate.khataNumber}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'North Of Property: ${realestate.northOfProperty}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'South Of Property: ${realestate.southOfProperty}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'East Of Property: ${realestate.eastOfProperty}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'West Of Property: ${realestate.westOfProperty}'),
                            const SizedBox(height: 8.0),
                            Text('Image: ${realestate.image}'),
                            const SizedBox(height: 8.0),
                            Text('Comments: ${realestate.comments}'),
                            const SizedBox(height: 8.0),
                            Text('Attachment: ${realestate.attachment}'),
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
                                            List<RealEstate> newrealestate =
                                                <RealEstate>[];
                                            newrealestate.addAll(realEstates);
                                            newrealestate.removeAt(index);
                                            setState(() {
                                              realEstates = newrealestate;
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
              builder: (context) => RealEstateAdd(
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
    final mutualFund = realEstates[index];
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
        DisplayUtils.showToast(" RealEstate successfully deleted.");
      }
    } catch (e) {}
  }
}
