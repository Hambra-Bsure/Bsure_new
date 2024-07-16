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
    var token = prefs.getString("token");

    if (token == null) {
      setState(() {
        isLoading = false;
      });
      DisplayUtils.showToast("Token not found. Please login again.");
      return;
    }

    final url = Uri.parse('https://dev.bsure.live/v2/asset/category/RealEstate');
    final response = await http.get(url, headers: {
      "Authorization": token,
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
          content: Text('Failed to fetch real estate details'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> deleteAssetStatus(int index) async {
    final realEstate = realEstates[index];
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      DisplayUtils.showToast("Token not found. Please login again.");
      return;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.delete(
        'https://dev.bsure.live/v2/asset/${realEstate.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("RealEstate successfully deleted.");
        setState(() {
          realEstates.removeAt(index);
          getData(); // Refresh data after deletion
        });
      }
    } catch (e) {
    //  DisplayUtils.showToast("Failed to delete real estate.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Real estate', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : realEstates.isEmpty
          ? const Center(child: Text("No assets found", style: TextStyle(fontSize: 20.0)))
          : ListView.builder(
        itemCount: realEstates.length,
        itemBuilder: (context, index) {
          final realEstate = realEstates[index];
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
                          final updatedRealEstate = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RealEstateEdit(
                                realestate: realEstate,
                                assetType: category,
                              ),
                            ),
                          );
                          if (updatedRealEstate != null) {
                            setState(() {
                              realEstates[index] = updatedRealEstate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  buildInfoRow('Address:', realEstate.address),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Type of property:', realEstate.typeOfProperty),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Khata number:', realEstate.khataNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow('North of property:', realEstate.northOfProperty),
                  const SizedBox(height: 8.0),
                  buildInfoRow('South of property:', realEstate.southOfProperty),
                  const SizedBox(height: 8.0),
                  buildInfoRow('East of property:', realEstate.eastOfProperty),
                  const SizedBox(height: 8.0),
                  buildInfoRow('West of property:', realEstate.westOfProperty),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Image:', realEstate.image),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Comments:', realEstate.comments),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Attachment:', realEstate.attachment),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete asset?"),
                            content: const Text("Are you sure you want to delete this Asset?"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Cancel", style: TextStyle(color: Color(0xff429bb8))),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("Confirm", style: TextStyle(color: Colors.red)),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  deleteAssetStatus(index);
                                  List<RealEstate> newRealEstates =
                                  <RealEstate>[];
                                  newRealEstates
                                      .addAll(realEstates);
                                  newRealEstates.removeAt(index);
                                  setState(() {
                                    realEstates = newRealEstates;
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
                        Text("Delete", style: TextStyle(color: Colors.white)),
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
              builder: (context) => RealEstateAdd(assetType: category),
            ),
          );
        },
        label: const Text(
          'Add New',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
}
