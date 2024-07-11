import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/Vehicle.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Vehicle_Edit.dart';
import '../post_asset_addition/VehicleScreen.dart';

class VehicleScreen extends StatefulWidget {
  final String assetType;

  const VehicleScreen({super.key, required this.assetType});

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  List<Vehicle> vehicles = [];
  bool isLoading = false;

  final String category = 'Vehicle';

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

    final url = Uri.parse('http://43.205.12.154:8080/v2/asset/category/Vehicle');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = VehicleResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          vehicles = data.assets;
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
          content: Text('Failed to fetch Vehicle details'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> deleteAssetStatus(int index) async {
    final vehicle = vehicles[index];
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
        'http://43.205.12.154:8080/v2/asset/${vehicle.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Vehicle details successfully deleted.");
        setState(() {
          vehicles.removeAt(index);
        });
      }
    } catch (e) {
      // DisplayUtils.showToast("Failed to delete vehicle details.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Vehicle', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : vehicles.isEmpty
          ? const Center(child: Text("No assets found",style: TextStyle(fontSize: 20.0)))
          : ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
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
                          final updatedVehicle = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehicleEdit(
                                vehicle: vehicle,
                                assetType: category,
                              ),
                            ),
                          );
                          if (updatedVehicle != null) {
                            setState(() {
                              vehicles[index] = updatedVehicle;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  buildInfoRow('Vehicle type: ', vehicle.vehicleType),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Brand name: ', vehicle.brandName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Model name: ', vehicle.modelName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Registration number: ', vehicle.registrationNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Chassis number: ', vehicle.chassisNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Comments: ', vehicle.comments),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Attachment: ', vehicle.attachment),
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
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Color(0xff429bb8)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  deleteAssetStatus(index);
                                  List<Vehicle> newVehicles = <Vehicle>[];
                                  newVehicles.addAll(vehicles);
                                  newVehicles.removeAt(index);
                                  setState(() {
                                    vehicles = newVehicles;
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
              builder: (context) => VehicleAdd(
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
}
